Return-Path: <linux-input+bounces-14111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B137B2B227
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 22:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D76A684218
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 20:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A509475;
	Mon, 18 Aug 2025 20:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QqAFE46F"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE8C274FCE
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755548082; cv=none; b=rUmG+9TOUJIg1vAEe1GDaV9jow1Wa0CdfW8q8Mgt7dd8NV4L4WpRpwfJRcO18qhjhIFN7OuiwphD5VK0Ztc7jVFGsgcMiMETpr8Fj16qWjtDrmT5ApktW7xAm5ITGnm1/JZMTceZ/DsQ/8DYrgY2DybWYSB1zRmwYGP1/c+WMNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755548082; c=relaxed/simple;
	bh=bwvyfdQ/fHA0Znhw7LDO141t4jAYvsxdGSxHA9sEnC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHa6iWSdFkDictOtoL6RLIF+vxqd2iTjIRi0vFWMnCu+3dYMrJnAHEFHYOsvQ1wTISdFDKAXJc1JX06JfTw2tu/w/UWV2BR5K1Dap0ib22P9fY79q9vnouoD7XkV1Ep756lhbCtQJr9JlTQe56guGO0iP37aAAUtPhZZssSUlxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QqAFE46F; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb73394b4so692857866b.0
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 13:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755548075; x=1756152875; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7AbLN0mEOCL5wJFjFbEqIHTYiHqCns+0OdQO7zoWlxk=;
        b=QqAFE46FvC8YG3khN+Kp0TfBpy2n8uoDKrnFE0KMM9G9wuMBrbT0ZNhYkEfQcV/t2r
         YXrHnvoZ+zr4aA9YJWeRsEH3lx4XOWs4GUxvzD26qV+jVpVbOs9PZwkhztvUTv/RLiqs
         f3Q98Hv7jaCEM5pThSld9r1xPiSYKhhfmvJMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755548075; x=1756152875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AbLN0mEOCL5wJFjFbEqIHTYiHqCns+0OdQO7zoWlxk=;
        b=OVzwebdWcEnFcyspCefNaarjiLBjn04nSgrGIsv7gOB697fsJyDGLWWnfrZU6wEZe2
         GMUWvBsYX8SCGO/EBNwaQwARLK+3MKtXF9uEjwU1xTCkEPp2pjjt+UIAIc9uC4a7kud3
         4DHSpdf6W4BDMLD5sXSIsB5M7VAEUAyuQJhaWBFF46bXJFezO6X2OHJHamk39D7+phmX
         2NcNB0ADhUt4GUQTir1Iu4hLyOdjgmkle8y+L+pW5Tt1ZnWEoO/0J/glnZcHUz6GlzH8
         9ZgGaVX41vE8U06n94PVyLIrbl0M0ZLgKifUkvQqSesPCRw7ZM7f1yEkDZGiMRpezGCf
         mOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTt+0Q4yapZ3hmkwN5TF16rhoMFI9rgTUowiDEmtLF5hZShEjw+eRa+OgMwOz+IiRjh9AacnPXYpl+kA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkwFbbVPY92MSbFxCYESs7R1WaVaDCsjrG1WMpAaF5WpeaeEl4
	owxMzlNHlGuNW2EXuAlfTfUnKy6Q3Mx1zGd9P6aSqRIgK61Q1b/+5OCdBnIijoYbHNsu8jeL+vS
	PSWAuhg==
X-Gm-Gg: ASbGncuwsLdhMe0MIOfW8uPlrfqC5lkQ8ky4uqE1twBws0IRObXWeSNubIyuDA5MvLC
	ggTxhX/GWE7yOwq1/qiQi800Nk1iG8dfm3nq9UAXR1HNgHKZy9+3RpcXXJlAKF0RfRNSOfLjUBo
	nrnfbMq+ji+3snP+I+PXsrdj23Mmj/5HdrtmQNv7z9Z8yFw0EAnHHunceUXXb+dXaicVE7nBuev
	c642LYE/hKB3u06lPBbwqjCS19AdfQ/dHblkf/Sakg2xGCNEHnAsMI1hA5rnVMePgEJMIorbXZk
	71DCUDlUHYM3iFbvUdaAr9OaGaBVtS4QisYS1xZCv9v+mz37uZmvYEh19Y7JATurMzYn0y4bfgz
	WfZ1sDMf0JwXsx3Zq4ZkOdjJPdPA5nkarMt89L25K8vts7k50stUVG7HhuA7BZw==
X-Google-Smtp-Source: AGHT+IEcWn0Zakub+SKn++bRhrwKdj5+vDTGbvIqhM6YQysYtKy0a+GM9hJ3F1z+h94gtTp3FohHLg==
X-Received: by 2002:a17:907:3f0a:b0:ae3:a812:a780 with SMTP id a640c23a62f3a-afddd248fbfmr7627366b.61.1755548075051;
        Mon, 18 Aug 2025 13:14:35 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53f37sm863775266b.21.2025.08.18.13.14.26
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 13:14:26 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so606302066b.3
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 13:14:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcPI7U+/nJfPPM5wanwGGOSBVCM2Xy9DmrlF561idMKyfdpy6qtg89bLpKSzAqsxcHBSuYQfrSvxwF9A==@vger.kernel.org
X-Received: by 2002:a17:907:2d10:b0:afd:d994:cb3 with SMTP id
 a640c23a62f3a-afddd24993emr6364066b.65.1755548065667; Mon, 18 Aug 2025
 13:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org> <20250818115015.2909525-2-treapking@chromium.org>
In-Reply-To: <20250818115015.2909525-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 13:14:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
X-Gm-Features: Ac12FXxhwq2Tdk0MQ-VqGrmgMkR2gFXqi4A8weX1E66vNCEQGqMpqL4njS8RunA
Message-ID: <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 18, 2025 at 4:50=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Introduce a new HID quirk to indicate that this device has to be enabled
> after the panel's backlight is enabled, and update the driver data for
> the elan devices to enable this quirk. This cannot be a I2C HID quirk
> because the kernel needs to acknowledge this before powering up the
> device and read the VID/PID. When this quirk is enabled, register
> .panel_enabled()/.panel_disabling() instead for the panel follower.
>
> Also rename the *panel_prepare* functions into *panel_follower* because
> they could be called in other situations now.
>
> Fixes: bd3cba00dcc63 ("HID: i2c-hid: elan: Add support for Elan eKTH6915 =
i2c-hid touchscreens")
> Fixes: d06651bebf99e ("HID: i2c-hid: elan: Add elan-ekth6a12nay timing")
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> Changes in v3:
> - Collect review tag
> - Add fixes tags
>
> Changes in v2:
> - Rename *panel_prepare* functions to *panel_follower*
> - Replace after_panel_enabled flag with enabled/disabling callbacks
>
>  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
>  include/linux/hid.h                   |  2 ++
>  3 files changed, 40 insertions(+), 19 deletions(-)

Re-iterating my response from v2 [1] so it's still seen even if people
only look at the latest version. :-) If HID folks don't mind us
landing this through drm-misc, feel free to Ack this patch. If HID
folks would rather not land through drm-misc, the default plan would
be to just wait until patch #1 makes its way to mainline before
landing patch #2.

Thanks!

[1] https://lore.kernel.org/r/CAD=3DFV=3DUV8_XGmxC=3D7Z18PEnj6wKz+yZQuV_4h+=
LJh_MNCqszvg@mail.gmail.com/

