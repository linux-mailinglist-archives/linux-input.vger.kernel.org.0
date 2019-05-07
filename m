Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE0D216B53
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 21:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEGT1s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 15:27:48 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35227 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbfEGT1s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 May 2019 15:27:48 -0400
Received: by mail-pg1-f196.google.com with SMTP id h1so8814449pgs.2;
        Tue, 07 May 2019 12:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=UsO+U03AZmNxGw5Vmiy9onXJw2kyj5f6knAPlgEnwvA=;
        b=PMZ5yccxZhPQByq4vbt3SM7vQ98wEzRrFZ+a59T5vibYhMFx9No3MkUk3g+fdRyIpF
         PsXBFIP7aqhsqUYV3Vs+4KCkBd6sHAXcz8pAjV0FG3qbRZaLddfP5FWkAr+XchWlXAr2
         CVFu7ohEkigDbqWPEi2W1scgQfVqNXHtinXKhLqBGNf1Etx103aCRvx+6Lh5SJntx5oD
         9e5IBIPfN63hZeNrcgrH/31daPJjTRCqNvjvJZtSfqIvtmGsXHjlHIhhtf09HQKM3Y5v
         fW5ZVrwdBNnVsSg/z9qQsmJbtI9V1kuOJn5Fo87bJY0quiU9tHp2V4XITNU6ffKkPkH3
         rmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=UsO+U03AZmNxGw5Vmiy9onXJw2kyj5f6knAPlgEnwvA=;
        b=XtSCQLqAjx3mpG58ccehH1g1qbJ6BttzNDdR2uiQty5uKvh1BYhUnw16jTjK2L43Fo
         rc1N01zCvj98r81I8/FilDpjD2wAy5X4sioddE56uRocXAQkq18QNk20+G7z/DsNJRZV
         WVNlXEf9Oh2NC9elQKJbufj1DV08IZ89CI8+GMI9JpbfWvwAffemRjKMEL8QrU3tkiKY
         6cVlTCLUmYXM1FboxAOKvEd1fksvvzXoUObq4PrHQNt9XavXV3Dl674uI8vpseMr/Nos
         OkH/9avgoWnCWOPom+YzM3/coW8+/LXnH7tT8mEJWjdGfiCLBc3raXVhlDg0U2Q+xFrJ
         bVDQ==
X-Gm-Message-State: APjAAAU9ALO637bof7IozwOfQ/68oGjOhevvog9g/BCKNexhMitBPIlD
        crsYGinIqmi0b+/IgEwo8ek=
X-Google-Smtp-Source: APXvYqx3QdxmS1TfgpJjb2UvoVR9Qfb7R65IPICkhpfEPHLIPPUNYsGbV26fkjhj/5GbeT1ZXe/mrw==
X-Received: by 2002:aa7:8c1a:: with SMTP id c26mr43137193pfd.25.1557257267204;
        Tue, 07 May 2019 12:27:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b22sm21831486pgg.88.2019.05.07.12.27.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 May 2019 12:27:46 -0700 (PDT)
Date:   Tue, 7 May 2019 12:27:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] Input: libps2 - mark expected switch fall-through
Message-ID: <20190507192744.GA248929@dtor-ws>
References: <20190507182409.GA11027@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190507182409.GA11027@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 07, 2019 at 01:24:09PM -0500, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
> 
> This patch fixes the following warning:
> 
> drivers/input/serio/libps2.c: In function ‘ps2_handle_ack’:
> drivers/input/serio/libps2.c:407:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    if (ps2dev->flags & PS2_FLAG_NAK) {
>       ^
> drivers/input/serio/libps2.c:417:2: note: here
>   case 0x00:
>   ^~~~
> 
> Warning level 3 was used: -Wimplicit-fallthrough=3
> 
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thank you.

> ---
>  drivers/input/serio/libps2.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
> index e6a07e68d1ff..22b8e05aa36c 100644
> --- a/drivers/input/serio/libps2.c
> +++ b/drivers/input/serio/libps2.c
> @@ -409,6 +409,7 @@ bool ps2_handle_ack(struct ps2dev *ps2dev, u8 data)
>  			ps2dev->nak = PS2_RET_ERR;
>  			break;
>  		}
> +		/* Fall through */
>  
>  	/*
>  	 * Workaround for mice which don't ACK the Get ID command.
> -- 
> 2.21.0
> 

-- 
Dmitry
