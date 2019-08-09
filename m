Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398AC88070
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 18:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407111AbfHIQps (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 12:45:48 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36110 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406412AbfHIQps (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 12:45:48 -0400
Received: by mail-pl1-f194.google.com with SMTP id k8so45196805plt.3;
        Fri, 09 Aug 2019 09:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fC+iWISyIRlxP292OZH7zhhrRFIGkbHzKrFLem5U1lY=;
        b=oAF16IevzBmL62Db1ftInsD9CLosBzDAv6rOEQD6wm0JR07KcQ0nm3AKN/itNFTK9K
         ZAucyqnzy7OC0OENgbB4zRzYJ+YkytSc5SOyH23AGTLiL8Uuqk+7vh37bgu886MXjA9U
         ZAcZ6SggTXeYwqTUP1kXlXkFoyY1J8Y2NhAezuGNfNobDN9Kyp1T8JPoet7SQAkF+491
         T0c6LSMYq/vgj8R9BF18KqToJeKh0i6cnRs/WglBCJ9MehPr7mAbmzgxIf43MjLGwlmK
         OSslpqj4aAT6d/FxDuWxR4B1gNnFUGu4Z98T6hXdNGDkO4KUpQf3tos2ZRZb0nYgBKur
         /iSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fC+iWISyIRlxP292OZH7zhhrRFIGkbHzKrFLem5U1lY=;
        b=HWzz4vpFPvohlZFK3v6BlKTMcOkc2jmDZPQRGTtoO1imWIsrVKVCPDOWJjk84KBfiJ
         tiw6BMtxvan9Vaa3qbh0fdXxmLO/Y1z7XMF7ZSziTwtlpUKMfEkc/gGknJQoOPHExlYU
         0n+A+oCeBNvUN0LlbxfBQ3Lli0cznF9SMK5A2VF4NDfx7CoPkEczqj3TwOV6l4fZtDZi
         dfohokaJ4EbdKSmAPofRaUmWgTJTnYdbtrSPsHqORJQ70mPtYIAm24z2/e6j7pmifWNO
         N6YH/jlxMrd+UOBiKpFFYLiFZlp7dpKaM9/LzhbiIlOUTPyKkGdWrtmYCAtbA+Rv2ri8
         QfaA==
X-Gm-Message-State: APjAAAX7EpR1GPbq6Bf51R838uYjemu2eDEWza/QWx/IAXT/rwRxOqMR
        MBikrizB8ozfzWXSHdeMRZo=
X-Google-Smtp-Source: APXvYqxwsoHu7zSgLhchshilKocyRaYoyNg1d/GhuABSgIm8BHJyzpulwft+131qAKPDwvn5pF5zOw==
X-Received: by 2002:a17:902:7686:: with SMTP id m6mr19955746pll.239.1565369146822;
        Fri, 09 Aug 2019 09:45:46 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i3sm105240142pfo.138.2019.08.09.09.45.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 09:45:46 -0700 (PDT)
Date:   Fri, 9 Aug 2019 09:45:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     benjamin.tissoires@redhat.com, grawity@gmail.com, dev@pp3345.net,
        lyude@redhat.com, teika@gmx.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics - Fix a typo - synpatics --> synaptics
Message-ID: <20190809164544.GM178933@dtor-ws>
References: <20190809150814.24793-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809150814.24793-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 09, 2019 at 05:08:14PM +0200, Christophe JAILLET wrote:
> This should be 'synaptics', not 'synpatics'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

> ---
>  drivers/input/mouse/synaptics.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index b6da0c1267e3..bbd799c7b058 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -191,7 +191,7 @@ static const char * const forcepad_pnp_ids[] = {
>  };
>  
>  /*
> - * Send a command to the synpatics touchpad by special commands
> + * Send a command to the synaptics touchpad by special commands
>   */
>  static int synaptics_send_cmd(struct psmouse *psmouse, u8 cmd, u8 *param)
>  {
> -- 
> 2.20.1
> 

-- 
Dmitry
