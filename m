Return-Path: <linux-input+bounces-147-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 437EC7F1FF8
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 23:07:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F27322821FF
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 22:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB3039848;
	Mon, 20 Nov 2023 22:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iQFG6rWD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC10FED
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:07:43 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507b9408c61so6609610e87.0
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700518061; x=1701122861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBhBZ4F1bmJ96bITv0QkK1zh22braeHPmqi4t7lTsTQ=;
        b=iQFG6rWD5YFeuEllccHsezQyNwhF28r02Vhx41BeuCIuFCzI6t2BBX26I9ODKGtzvs
         JDNIp2EvwHPeBcT6oYRsb1KlTOV8xDnBTK2ZBHuRHvMVfpBlfrioW6OK+JWQkn8COYxb
         j1ubWirLSaK/WFkHLmIBd6zUpiqo3Y1ssflzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700518061; x=1701122861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBhBZ4F1bmJ96bITv0QkK1zh22braeHPmqi4t7lTsTQ=;
        b=b0021NjgNJWs0CkAlyVVH6cpuyXPjzTp98gDRuvSp9h/ZwnlrlidRLLa+zGUcCUmR9
         UadxcKAzXxRI+hA7n6wU3SBq7mz83Y4GljaBaPr1hhcdwES4xSTluA0r03/u/G5qRxyg
         0fiWMav3tjPRy5TkqHoORtoKwooomwEpa9NawwMAeTTbI2GbzSFu+l685OEcgIEsEiZO
         tkf+v9EyRdnz9rh0vVpZiaRCMM9cRRorWzi1TMDJ6WWHqBrMVsGmvo+Ixanylw6htMXZ
         loMd+4RyLbSUQkp1RNTXwsQe9bjqE4jsAUuDOTWr/0gXe03LzLjiacnIjS2zJhMKOUjh
         MYfg==
X-Gm-Message-State: AOJu0YxsKlU37Xu5/7ToR7WwzrRdCAQWSgx97EUL69sv1pu3yksS16p1
	PNRnE2w8F6qUIeQTwXdJi8NKPa2aPH5SKR1K++0b8w==
X-Google-Smtp-Source: AGHT+IHWe81uSWzJ7jBdgyFl1gkWHQEUkhAwpQd0BYu4xomW7FgI9jBYdEnCu8BE/g5ursGTT4IQuw==
X-Received: by 2002:ac2:59c9:0:b0:509:f45c:fae6 with SMTP id x9-20020ac259c9000000b00509f45cfae6mr7778549lfn.10.1700518061242;
        Mon, 20 Nov 2023 14:07:41 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id w9-20020a056402128900b005488bf98309sm2396846edv.56.2023.11.20.14.07.40
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 14:07:40 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4078fe6a063so8135e9.1
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:07:40 -0800 (PST)
X-Received: by 2002:a05:600c:1c83:b0:3fe:eb42:7ec with SMTP id
 k3-20020a05600c1c8300b003feeb4207ecmr311087wms.1.1700518060454; Mon, 20 Nov
 2023 14:07:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120193313.666912-1-hdegoede@redhat.com> <20231120193313.666912-6-hdegoede@redhat.com>
In-Reply-To: <20231120193313.666912-6-hdegoede@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Nov 2023 14:07:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XR5jG+8c3H9yKtMNnMvMnPGRmHh-FDqFhWptAuGr4=8g@mail.gmail.com>
Message-ID: <CAD=FV=XR5jG+8c3H9yKtMNnMvMnPGRmHh-FDqFhWptAuGr4=8g@mail.gmail.com>
Subject: Re: [RFC v2 5/7] HID: i2c-hid: Turn missing reset ack into a warning
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Julian Sax <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>, 
	Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com, 
	Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>, 
	Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 20, 2023 at 11:33=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
>
> On all i2c-hid devices seen sofar the reset-ack either works, or the hw i=
s
> somehow buggy and does not (always) ack the reset properly, yet it still
> works fine.
>
> Lower the very long reset timeout to 1 second which should be plenty
> and change the reset not getting acked from an error into a warning.
>
> This results in a bit cleaner code and avoids the need to add more
> I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirks in the future.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

