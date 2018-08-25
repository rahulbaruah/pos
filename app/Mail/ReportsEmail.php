<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class ReportsEmail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($content)
    {
        $this->content = $content;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('emails.report_mail')
					->subject($this->content['subject'])
					->with('content', $this->content)
					->attach(storage_path('app/reports/'.$this->content['file']), [
                        'as' => $this->content['file'],
                        /*'mime' => 'application/pdf',*/
                    ]);
    }
}
