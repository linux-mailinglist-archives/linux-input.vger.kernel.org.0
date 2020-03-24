Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060B219197B
	for <lists+linux-input@lfdr.de>; Tue, 24 Mar 2020 19:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgCXSwa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Mar 2020 14:52:30 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:36215 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgCXSwa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Mar 2020 14:52:30 -0400
Received: by mail-pj1-f67.google.com with SMTP id nu11so1883371pjb.1
        for <linux-input@vger.kernel.org>; Tue, 24 Mar 2020 11:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c+p7uBmHPGLCaEAYjZ1RI+tE5pxvx9tHCJ0o5iD1x88=;
        b=EUrqrdtfio2RX/5Ysvug9fe1DUvUhxOlnSyEf8n/tUtU1Hqj4ETLkpqYvt2xbI/6PS
         JlQHCQJhI5+QOVELdjxvpDHal+sw7xTlArWVpsQ1ZhTNDHnFJ5aGGxinSG9j9JpvCtQ3
         7U2LoS4fkY5po3zYavdgzvzme/+hIPUffL9+NYL6mssoV/2lY/XeioCxVNs6tIZ4mJhm
         wFipxYthB+muRSMKPfFyfkF4w5Nbh+Tqnp58u7FCY+vIsBjsR9G+k4uT0F2gKu9G0WSx
         k8swhWmpIucwhej3JLVAFlfB3hJJuIrV6qx9a0Cf1EU/qNAxWoGlGUlo/9Nam0+E9eYW
         zbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c+p7uBmHPGLCaEAYjZ1RI+tE5pxvx9tHCJ0o5iD1x88=;
        b=eUwN+/bgpSh1kgkmcYAjVwnAM7amOREihjv5sBn/riqUBYd0gjmawGuDJNxFHLkjd8
         EJsaDDe6o/ExVv4uZOC/wQLAgfeF1Y2rfld6XWS0Ne2CUBJCFoSe/BiARs68tfvUS+Vk
         WNNzJEqge1iDepkRixhpaaTW0/ZE1kOErS/SNJNsNwEzUXZ4aZC67I7LV2IlJfNb/B3M
         ZbJu4QCW+7kw4M7rAw684xHD+b6Pz2XUAWuq5ZYdb8G7pWlzp9oPq/KXOxF4s+gDZMRI
         PZ/hLBmGgvEJrjdlb2wBKfoLUFTCq06dyHl5le58hHyLFR6IG2iFJ5QOugT61C4huSej
         L5/w==
X-Gm-Message-State: ANhLgQ0VRAMOle23XBovtSF7vzyII+bVKpFSwPtPSgKRKLYc+4+tVIpj
        lb2zHWlqPDL9IVF0OeTMTbA=
X-Google-Smtp-Source: ADFU+vtGaAPLhO89bekT5GE+q8tEeuBnuqa9znSAntK+r5UZANaP3o/LHbskFE8qTyeY/Iv5oaD/ow==
X-Received: by 2002:a17:902:76c9:: with SMTP id j9mr2275908plt.166.1585075948747;
        Tue, 24 Mar 2020 11:52:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id x3sm16184249pfp.167.2020.03.24.11.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:52:28 -0700 (PDT)
Date:   Tue, 24 Mar 2020 11:52:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Mastykin <dmastykin@astralinux.ru>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Input: goodix - Fix spurious key release events
Message-ID: <20200324185226.GD75430@dtor-ws>
References: <20200316075302.3759-1-dmastykin@astralinux.ru>
 <20200316075302.3759-2-dmastykin@astralinux.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316075302.3759-2-dmastykin@astralinux.ru>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 16, 2020 at 10:53:05AM +0300, Dmitry Mastykin wrote:
> The goodix panel sends spurious interrupts after a 'finger up' event,
> which always cause a timeout.
> We were exiting the interrupt handler by reporting touch_num == 0, but
> this was still processed as valid and caused the code to use the
> uninitialised point_data, creating spurious key release events.
> 
> Report an error from the interrupt handler so as to avoid processing
> invalid point_data further.
> 
> Signed-off-by: Dmitry Mastykin <dmastykin@astralinux.ru>

Applied, thank you.

> ---
> Changes in v3:
> - Improve commit message
> 
> Changes in v2:
> - Improve commit message
> ---
>  drivers/input/touchscreen/goodix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 04b5c7b..cc965fe 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -329,7 +329,7 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>  	 * The Goodix panel will send spurious interrupts after a
>  	 * 'finger up' event, which will always cause a timeout.
>  	 */
> -	return 0;
> +	return -ENOMSG;
>  }
>  
>  static void goodix_ts_report_touch_8b(struct goodix_ts_data *ts, u8 *coor_data)
> -- 
> 2.23.0
> 

-- 
Dmitry
