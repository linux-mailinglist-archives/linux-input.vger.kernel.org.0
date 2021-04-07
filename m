Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8C1356AE9
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 13:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351782AbhDGLQE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 07:16:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1351780AbhDGLQD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 07:16:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F214F61154;
        Wed,  7 Apr 2021 11:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617794154;
        bh=zGQKLzAPrUTjYN5l4TzYhul5bISfbo9smRVnq70A4kY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pxHTe0AlVKXKAg8iftJE8Aod+PeZ5YCs16pkr4+IV6Nt84BxTfvZCpW+fWxdzbuTr
         5S2SYSFKEjTfn3R6nMvnQEjfCXiaJQpFqAA2Xl3yCm74eFz6ImfR7BnKTqn23bqSRW
         oQDsPDNCT09u2f7iN3Z6RtfKEdZ9u863FRv2yXt+krEaerNL3nTAB2Bq6kAmeIoUyd
         Mki8HWzEokvEs7qp2/KjK+ssUGEIj3EKLa1yIYpXIjaKHRih5ItX/r5foyehuMXMd/
         DjZvCsuiXccDEqEQYGbgDXlyTqqklBtRj5qRQJ7S3wdX7G5baZzxtB6I/intr406m7
         6mh1L0y8PqUjg==
Date:   Wed, 7 Apr 2021 13:15:50 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     John Chen <johnchen902@gmail.com>
cc:     linux-input@vger.kernel.org, Rohit Pidaparthi <rohitpid@gmail.com>,
        RicardoEPRodrigues <ricardo.e.p.rodrigues@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2 2/4] HID: magicmouse: fix 3 button emulation of Mouse
 2
In-Reply-To: <20210330113319.14010-3-johnchen902@gmail.com>
Message-ID: <nycvar.YFH.7.76.2104071315240.18270@cbobk.fhfr.pm>
References: <20210330113319.14010-1-johnchen902@gmail.com> <20210330113319.14010-3-johnchen902@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 30 Mar 2021, John Chen wrote:

> It is observed that, with 3 button emulation, when middle button is
> clicked, either the left button or right button is clicked as well. It
> is caused by hidinput "correctly" acting on the event, oblivious to the
> 3 button emulation.
> 
> As raw_event has taken care of everything, no further processing is
> needed. However, the only way to stop at raw_event is to return an error
> (negative) value. Therefore, the processing is stopped at event instead.
> 
> Signed-off-by: John Chen <johnchen902@gmail.com>
> ---
>  drivers/hid/hid-magicmouse.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index 7aad6ca56780..c646b4cd3783 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -440,6 +440,21 @@ static int magicmouse_raw_event(struct hid_device *hdev,
>  	return 1;
>  }
>  
> +static int magicmouse_event(struct hid_device *hdev, struct hid_field *field,
> +		struct hid_usage *usage, __s32 value)
> +{
> +	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
> +	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
> +	    field->report->id == MOUSE2_REPORT_ID) {
> +		// magic_mouse_raw_event has done all the work. Skip hidinput.
> +		//
> +		// Specifically, hidinput may modify BTN_LEFT and BTN_RIGHT,
> +		// breaking emulate_3button.
> +		return 1;

I have fixed the comment style here, and applied the series. Thanks,

-- 
Jiri Kosina
SUSE Labs

