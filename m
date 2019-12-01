Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9294010E02E
	for <lists+linux-input@lfdr.de>; Sun,  1 Dec 2019 04:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbfLADIW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Nov 2019 22:08:22 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:41211 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbfLADIW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Nov 2019 22:08:22 -0500
Received: by mail-pl1-f193.google.com with SMTP id t8so14536691plr.8;
        Sat, 30 Nov 2019 19:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/hLBoSlob5s789wTL2XcH8c7JKpIgMLhl5+fSLzoJ3I=;
        b=cj6rzPONcjGOwhTU/4/Pf6eRK5WAaZd8Sp+1Lqa61612W3JeRD/lyjfQ/95oWpoW/c
         fwnu+fL1Sa6kbzA45iWlrVL5xZ/6dk6jY1L35UDqU6/B19RDMcqhAjpb+JjcLv9Z98jF
         pqN2VAvwZqntIv+lxe70UGSZh9pgJxJkkPfxq6gTg1OKKzNUzKVXb8BM58GVujMSzEKA
         FtrARdwxEPhEQLKZ8RFAf4B8XKR49ZNXzTItj7yxNJYiKw+SuroqOlkKcYWmxGwa8aoG
         zvHTuCIKUIHY6OTRhEQb9dL8AKh+WT4u5qbKCdWtTuz+8u9ttuZG4/LJM2uTRETtPgId
         9biA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/hLBoSlob5s789wTL2XcH8c7JKpIgMLhl5+fSLzoJ3I=;
        b=YJDfLiy8RLQ/QMRwWSAG6Mxryf+QkRpsQZ78fHjDgMt0XvbJmUcgvuXzroBQXR2Y/R
         0obUV1o2Efh7kAChPEScHsjLwgU4L5kFnjd6KXAPVY2X9BJ2QPCiBKIEGOlT1VtIO/Et
         VIWnX/JptvmETRi8aaY0EYnaGADEX0hdFDuKSuIqcJUHYL00nqB5e5yd7fwcjKjXTFC5
         6ealrACDND3Ax61QTl1FFnhaAUm3ZhV+ZFIPB+MZ3dwsh+Sgzknl7Ro9yjAihHvT9x+i
         R6GAzyMePw5cy/RTt2dkNy1s+GyvYe1cLgxFRH7rfB1GOYOLYIAY7/TLOtjSBBg/JVKQ
         Djtg==
X-Gm-Message-State: APjAAAUkAkY+Xe2DgauIVWWpmjwGecDY7CO3Eoyodn/cWdjtlkrEzUXS
        20ArUYgU6bHMtt+lljRvVgg=
X-Google-Smtp-Source: APXvYqywWBIab6N3nl1QSM0j3H0Wyd20G6s9vbEPZ9bdxevDcZ9hzQ5pYeR38wtNgYmuolMfNJgbJQ==
X-Received: by 2002:a17:902:d905:: with SMTP id c5mr21622944plz.60.1575169701456;
        Sat, 30 Nov 2019 19:08:21 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p68sm11794487pfp.149.2019.11.30.19.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:08:20 -0800 (PST)
Date:   Sat, 30 Nov 2019 19:08:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yannick Fertre <yannick.fertre@st.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Philippe Cornu <philippe.cornu@st.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Bastien Nocera <hadess@hadess.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: goodix - support gt9147 touchpanel
Message-ID: <20191201030818.GM248138@dtor-ws>
References: <1574850526-13518-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1574850526-13518-1-git-send-email-yannick.fertre@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 11:28:46AM +0100, Yannick Fertre wrote:
> From: Yannick Fertré <yannick.fertre@st.com>
> 
> Add support for it by adding compatible and supported chip data
> (default settings used).
> The chip data on GT9147 is similar to GT912, like
> - config data register has 0x8047 address
> - config data register max len is 240
> - config data checksum has 8-bit

If it is compatible with gt912 then the driver does not need another
compatible in the code I think. Rob will tell more.

> 
> Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
> ---
>  drivers/input/touchscreen/goodix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index fb43aa7..b470773 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1045,6 +1045,7 @@ static const struct of_device_id goodix_of_match[] = {
>  	{ .compatible = "goodix,gt9271" },
>  	{ .compatible = "goodix,gt928" },
>  	{ .compatible = "goodix,gt967" },
> +	{ .compatible = "goodix,gt9147",},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, goodix_of_match);
> -- 
> 2.7.4
> 

-- 
Dmitry
