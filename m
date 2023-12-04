Return-Path: <linux-input+bounces-472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2957803A45
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 17:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F0671F21095
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 16:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4842E418;
	Mon,  4 Dec 2023 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I65nDDfM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BABC6
	for <linux-input@vger.kernel.org>; Mon,  4 Dec 2023 08:28:49 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a1a496a73ceso422236366b.2
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701707325; x=1702312125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIYE33WSSz/GZI3Z1d8WLcurFqsj/j6dC51Tigb8vUU=;
        b=I65nDDfMmIhM6lrDO7vaHz8QvEiNCLlHhJIbrobmor0Srox5IAItzEgSJGOeUvZnVm
         ORKfPXHaf16OsWW0OT+UxJSVkuW6uSdLvSw3DNc98fwC1Ls/FmvWYbe49zlkvANdevzV
         ZX9BZ1fAlU5qrWbwKmxw4X5nz78ROS/C4GX3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701707325; x=1702312125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIYE33WSSz/GZI3Z1d8WLcurFqsj/j6dC51Tigb8vUU=;
        b=QpMLqfYzMf6MJ2MZhZS+NQYs/UiLCoPVAGrZLo0n5c8HO8F0k8mOAI8f8yJGsLN1+6
         Qp1HVVX8THos1dUl5zQFh+IJofTAAUDd9e7tzo8nIJBUNLpbKnjYKsSPT5BS23byoH0M
         DBbGOIIY696/c5oMHdxzCwGVxi+dNkhID/0cqxDSevycBPoYQ7e1UfOzYv2pvXxsckdm
         bQhffN/lFMybt0555eBdYguqhMIf4gxkJobb6aMmjuXNfLj/7tCVuwMQHVt9VGp5kE2z
         PCFrqOERjXE2LAp46zR/HH/2LQskYc1JtQtjrBdj3utmiSzLR4A5UmrqD6ng5nnH1CkF
         kTZw==
X-Gm-Message-State: AOJu0YzBif0XEHPy4HXHWlkdumvQHeDdCxyKU7gVet1GFUYfvQPPJ6ms
	bhdGDRenEQGob1oe+mD4pQULFDpagSX0EkkA7j9P6Px5
X-Google-Smtp-Source: AGHT+IHgk63E+hLMx8Tv0UfatXyE/+rAuQF8Ooo8THClT6BXZd6bNjxAYhv0P6CLbij0MNeG5qXwXw==
X-Received: by 2002:a17:906:7152:b0:a19:a19b:78c9 with SMTP id z18-20020a170906715200b00a19a19b78c9mr3621681ejj.140.1701707325752;
        Mon, 04 Dec 2023 08:28:45 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id cb26-20020a170906a45a00b00a0958af2387sm5405138ejb.201.2023.12.04.08.28.44
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 08:28:44 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40b367a0a12so99115e9.1
        for <linux-input@vger.kernel.org>; Mon, 04 Dec 2023 08:28:44 -0800 (PST)
X-Received: by 2002:a05:600c:3ca3:b0:40b:5972:f56b with SMTP id
 bg35-20020a05600c3ca300b0040b5972f56bmr406586wmb.3.1701707324210; Mon, 04 Dec
 2023 08:28:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231202224615.24818-1-hdegoede@redhat.com> <20231202224615.24818-5-hdegoede@redhat.com>
In-Reply-To: <20231202224615.24818-5-hdegoede@redhat.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Dec 2023 08:28:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WrZ5heSS6Zy+F94WgiNzOKrWfQVJSTdiOW_Obih5K0Fg@mail.gmail.com>
Message-ID: <CAD=FV=WrZ5heSS6Zy+F94WgiNzOKrWfQVJSTdiOW_Obih5K0Fg@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] HID: i2c-hid: Move i2c_hid_finish_hwreset() to
 after reading the report-descriptor
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Julian Sax <jsbc@gmx.de>, ahormann@gmx.net, Bruno Jesus <bruno.fl.jesus@gmail.com>, 
	Dietrich <enaut.w@googlemail.com>, kloxdami@yahoo.com, 
	Tim Aldridge <taldridge@mac.com>, Rene Wagner <redhatbugzilla@callerid.de>, 
	Federico Ricchiuto <fed.ricchiuto@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Dec 2, 2023 at 2:46=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> A recent bug made me look at Microsoft's i2c-hid docs again
> and I noticed the following:
>
> """
> 4. Issue a RESET (Host Initiated Reset) to the Device.
> 5. Retrieve report descriptor from the device.
>
> Note: Steps 4 and 5 may be done in parallel to optimize for time on I=C2=
=B2C.
> Since report descriptors are (a) static and (b) quite long, Windows 8 may
> issue a request for 5 while it is waiting for a response from the device
> on 4.
> """
>
> Which made me think that maybe on some touchpads the reset ack is delayed
> till after the report descriptor is read ?
>
> Testing a T-BAO Tbook Air 12.5 with a 0911:5288 (SIPODEV SP1064?) touchpa=
d,
> for which the I2C_HID_QUIRK_NO_IRQ_AFTER_RESET quirk was first introduced=
,
> shows that reading the report descriptor before waiting for the reset
> helps with the missing reset IRQ. Now the reset does get acked properly,
> but the ack sometimes still does not happen unfortunately.
>
> Still moving the wait for ack to after reading the report-descriptor,
> is probably a good idea, both to make i2c-hid's behavior closer to
> Windows as well as to speed up probing i2c-hid devices.
>
> While at it drop the dbg_hid() for a malloc failure, malloc failures
> already get logged extensively by malloc itself.
>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D2247751
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Use goto abort_reset instead of return on i2c_hid_start_hwreset()
>   failure, so that the mutex gets properly unlocked
>
> Changes in v2:
> - Adjust commit message to note that moving the wait-for-reset
>   to after reading thr report-descriptor only partially fixes
>   the missing reset IRQ problem
> - Adjust for the reset_lock now being taken in the callers of
>   i2c_hid_start_hwreset() / i2c_hid_finish_hwreset()
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

