class DownloadsController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_ssp_pdf }
    end
  end

  private

  def evaluation
    print "For evaluation_id #{params[:evaluation_id]}\n"
    Evaluation.find(params[:evaluation_id])
  end

  def download
    eval = evaluation
    print "Found #{eval.inspect}\n"
    Download.new(eval)
  end

  def send_ssp_pdf
    send_file download.to_pdf, download_attributes
  end

  def download_attributes
    {
      filename: download.filename,
      type: "application/pdf",
      disposition: "inline"
    }
  end
end
