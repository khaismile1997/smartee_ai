class PagesController < ApplicationController
  def home
    @audios = Audio.all.order(created_at: :desc)
  end

  def tts
    if audio_params[:prompt].blank?
      flash[:alert] = "🚫 Please provide input text for generating audio."
      return redirect_to root_path
    end

    voice_id = audio_params[:voice_type] == 'male' ? 'XnLDFn24EmnDEzIkXDMO' : 'CdiVRnYxQNY8ZFiP0rGR'

    TextToSpeechJob.perform_later(audio_params[:prompt], voice_id)

    flash[:notice] = "✅ Audio is being generated. Please wait a few minutes and refresh the page."
    redirect_to root_path
  end

  private

  def audio_params
    params.permit(:prompt, :voice_type)
  end
end
