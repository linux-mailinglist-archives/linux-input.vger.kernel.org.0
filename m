Return-Path: <linux-input+bounces-145-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8D7F1FF2
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 23:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C68CAB21841
	for <lists+linux-input@lfdr.de>; Mon, 20 Nov 2023 22:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23824374FB;
	Mon, 20 Nov 2023 22:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VcpmwxKv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD7CD2
	for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:06:08 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a00a9c6f283so101110666b.0
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700517964; x=1701122764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1//OURrp5eVPffpHmVul4YiAXt3+Xqnb/MCdl9IMzCk=;
        b=VcpmwxKvKnGYsPDJnRqjENB/5cXCdZdNij1LGe4QhH/MyxpYFGXK5fjstPR51o9EBc
         pAdABRlYLO+6qj7JhvrBvvDSW0R9TQxP1eCCK/hdswBhR+o8juGg9N7HK1fXdKs5Fn0c
         aHL+xSoXtsvFHQxYgIsp7+vfhR2XVRsHwhMhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700517964; x=1701122764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1//OURrp5eVPffpHmVul4YiAXt3+Xqnb/MCdl9IMzCk=;
        b=xQSQ8eRcgUVfrevkmwAWk2lA4EPucigDob1khdthEKuntis0OTwsxfwna695gtKUkQ
         h1QJrUxCfdWh2wwq5hRveeiVkUWA8uSeaYfhNLE/MslXbuSFuCC69AJZfCy1j8HfigtN
         CNNEUCLLV3pyDvz0uUWE24qhMiRb8/sB024bfnyPxCYiMOUCtaUXgbuMr2A74pNQsdwa
         nKhhw4fBrxiB85sAkuQGlA4L9FY5uwFcCYeSGasWw4M+hGNtDxWMvVPdWPhLxuveJ1uj
         JeampFqQ56a8PAhIu6X8uvvaCJA1eIPLDgB1jDWm4hlQdKEz+0XKW4sikXtWtQVgUWC6
         MvaQ==
X-Gm-Message-State: AOJu0Yx75fIWk5IIT6yygmC9wGioVqwfxfoV0WIWW53cJYiXKjdXW2q/
	C0frF1WJMN6YmhygokMPmMkHnKzO8MBVqkvUiRcaLQ==
X-Google-Smtp-Source: AGHT+IFGntm1/ey+4YO0ecAyxjbnCd5wKaRVWPsSxd5YqXzyODNF+M/AfZ/HPpuFrJA7gRtJCJB4Uw==
X-Received: by 2002:a17:906:3284:b0:9e0:2319:16f0 with SMTP id 4-20020a170906328400b009e0231916f0mr5873863ejw.65.1700517964721;
        Mon, 20 Nov 2023 14:06:04 -0800 (PST)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id cm42-20020a170906f5aa00b009fcf829d84csm2061058ejd.169.2023.11.20.14.06.04
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 14:06:04 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40a426872c6so22415e9.0
        for <linux-input@vger.kernel.org>; Mon, 20 Nov 2023 14:06:04 -0800 (PST)
X-Received: by 2002:a05:600c:5013:b0:405:35bf:7362 with SMTP id
 n19-20020a05600c501300b0040535bf7362mr486009wmr.0.1700517963838; Mon, 20 Nov
 2023 14:06:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120193313.666912-1-hdegoede@redhat.com> <20231120193313.666912-3-hdegoede@redhat.com>
In-Reply-To: <20231120193313.666912-3-hdegoede@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 20 Nov 2023 14:05:51 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Ui1Eurs2f_kOeJQAp8WqtqnTg3EAfDsQ0B8=wEPxGubw@mail.gmail.com>
Message-ID: <CAD=FV=Ui1Eurs2f_kOeJQAp8WqtqnTg3EAfDsQ0B8=wEPxGubw@mail.gmail.com>
Subject: Re: [RFC v2 2/7] HID: i2c-hid: Split i2c_hid_hwreset() in start() and
 finish() functions
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
> Split i2c_hid_hwreset() into:
>
> i2c_hid_start_hwreset() which sends the PWR_ON and reset commands; and
> i2c_hid_finish_hwreset() which actually waits for the reset to complete.
>
> This is a preparation patch for removing the need for
> I2C_HID_QUIRK_NO_IRQ_AFTER_RESET by making i2c-hid behave
> more like Windows.
>
> No functional changes intended.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Move the mutex_[un]lock(&ihid->reset_lock) calls from
>  i2c_hid_start_hwreset() / i2c_hid_finish_hwreset() to the callers
>  to make the locking more clear
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 38 ++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

