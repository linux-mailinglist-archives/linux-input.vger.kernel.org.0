Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28A0095D11
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 13:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbfHTLRX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 07:17:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42908 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTLRX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 07:17:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id b16so11965616wrq.9;
        Tue, 20 Aug 2019 04:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bXwvv3+bDP0X0rOQDdFLtwDDPymGiUwzjcOJ0HsnIoE=;
        b=p2PVwOPjW3GPoH2xQ0T6VFrvCH9Q37bASBLkU2zRM6QatFv2y8rptDncRm65Zx1Zza
         4J5c/sPWUjAFj5bTNwwcb2Qc4YgziJqHajkQAaqpXim1EueyoAZMjNFQu/KhrCvpjWFJ
         MR1CJ5jE1dQT4oEtygM2Tf5KmbArrSc3pAKXOG7xBWokFCsYRGOUWbWfvjziz0ZafL2e
         tKG4itMnTKNHHlKl8v5aza5guqMQN/8v1rVDXpstpIOPLtqYfwkLtxgOJ0HyGNmsIPBD
         OnDiGXmGUA7aH+AieNFNTdH0S5HqFb46zEXfC98fbF5JP0VYSHbJ9weiSmzCcrNNAqBb
         gzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bXwvv3+bDP0X0rOQDdFLtwDDPymGiUwzjcOJ0HsnIoE=;
        b=hBAVGpHraNcB5I6zQojRBWoICXBFPrKyS3SH5W3+zGNTdG4wFR5VX4LoC9mcKT2yd8
         kmooaRo3XjfdxhZt5oqlXoGM8XknYOgW1VoDPtuN558ZItuUK34OCjHQ5Nk2x3rzu0ik
         cuUKfpcnR+XoYgEHcSCv9tiHyjnak8SKFJ+xLbuzxZIrhAsa4oc61A0A6GaE0sggfmyO
         1v97dPad8H4kvYGeOUhJovhM/HqUdPJRaO0Kel1h0QM22/TM3NNkUBH8hgyV/M0HOzA+
         RvH8bpFzXIR5rAbEhyvKsFHb2KABlgexTC80u7h+lClvymgIV17fBe8q1goA9xBWvE6M
         ZQjQ==
X-Gm-Message-State: APjAAAVkOryMGhAs0JZ6Fa4HIU08bI7jEm5IHX7yjluhe/PaWKfp/Pa9
        o06m6DPDeItox9iNoxBqclg=
X-Google-Smtp-Source: APXvYqzoIgxGymU2wbx/jK3Z3oup/G3SR810t/fO7KbuQzxb0XC8CA0c8AA9b4NaBwg25QISd1IpkA==
X-Received: by 2002:adf:f48d:: with SMTP id l13mr35550680wro.190.1566299840925;
        Tue, 20 Aug 2019 04:17:20 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id 91sm54808747wrp.3.2019.08.20.04.17.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 04:17:20 -0700 (PDT)
Date:   Tue, 20 Aug 2019 13:17:19 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net
Subject: Re: [PATCH 2/2] drivers: input: mouse: alps: drop unneeded likely()
 call around IS_ERR()
Message-ID: <20190820111719.7blyk5jstgwde2ae@pali>
References: <1566298572-12409-1-git-send-email-info@metux.net>
 <1566298572-12409-2-git-send-email-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1566298572-12409-2-git-send-email-info@metux.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tuesday 20 August 2019 12:56:12 Enrico Weigelt, metux IT consult wrote:
> From: Enrico Weigelt <info@metux.net>
> 
> IS_ERR() already calls unlikely(), so this extra unlikely() call
> around IS_ERR() is not needed.
> 
> Signed-off-by: Enrico Weigelt <info@metux.net>
> ---
>  drivers/input/mouse/alps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 34700ed..ed16614 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
>  		/* On V2 devices the DualPoint Stick reports bare packets */
>  		dev = priv->dev2;
>  		dev2 = psmouse->dev;
> -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
> +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
>  		/* Register dev3 mouse if we received PS/2 packet first time */
>  		if (!IS_ERR(priv->dev3))
>  			psmouse_queue_work(psmouse, &priv->dev3_register_work,

Hello! Two months ago I already saw this patch. See discussion:
https://patchwork.kernel.org/patch/10977099/

-- 
Pali Rohár
pali.rohar@gmail.com
