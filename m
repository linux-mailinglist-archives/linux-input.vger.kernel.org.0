Return-Path: <linux-input+bounces-3921-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F158D2944
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 02:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 954532829AC
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 00:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FED4363;
	Wed, 29 May 2024 00:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VMuUrwVx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9B7632
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 00:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716941215; cv=none; b=aMNM1e72+pFMdnW52l0wZRly2gJ46Yko7WV4spz5u7S2e4ECdi+8XTvesC1oQobvVOW+i94J/b5P8HS6C+hZKTr1pbb8B00EzJmbP1cJkS3TneDucDXrtq1Dg6fq4BZIAh6YihhUicI7mS81jtzHjMV0Y0WNRhnU9uRxgrfDtcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716941215; c=relaxed/simple;
	bh=4moforG+k40EF9Ok7eqLlhLNcaFAtHxkI1l8E/9OvJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hQHxgomTptk9WEPz6iNQj4or4UlTqMvMQuBGBZqV/bx4frKZa/1gZCE1EgD9rsQ/Drkd+qQpgqsv1czZYQS1LAR0jffAu+aTU0pIRA4D3DjddF3HuhnbbS39dCgbBsl5koMUP4Iyjyx7d7Bylimdz9u1smgdpawztySk/374M+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VMuUrwVx; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5b2cc8c4b8aso1042787eaf.1
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 17:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716941213; x=1717546013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3D+sMMmYFgzaA4L3QQNH5bp4os7b/VOBhhe4AhzY9M=;
        b=VMuUrwVxW3MtDoh5tp5gU44C0IMsiQ2Pqpw3Zk8Jx+iOqh5Zl0yDeWlpBv/4ZH3PvT
         qWGOSfziMFp98Ca7woRi2BDFxIj0a4uqYcyVezTeFRyK2bahBqvQFxP7AOJC5nbYRFKY
         I5qAvIvdu5hBPd2QduqCPaiB9u21g69Tc6TQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716941213; x=1717546013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3D+sMMmYFgzaA4L3QQNH5bp4os7b/VOBhhe4AhzY9M=;
        b=ucMyaaFaBAYLEYL/KGTPOS1N7av19m3hcr5jJvomjtgsO5XaVr7drjRH2sHZHojljg
         yfTmtixSR9HcIjOJ0+SYPj6ty80PIg93Io/JRXQFkG1iABV44Kw4/XR3heq+uK91p1Z+
         LuiBEoM3HDgn3dqZZF9OT7o0rX6lf0u6jzPBIWF8lQhrsV2SSEsj6QMF3a6wenh4G3Av
         /yYwXACqZG/ZzSTwgvq5Ji5LrLWcRq+7GhG/WUAi1tu0jlvcdC2ZjkXYgaEKtIdI08jG
         8bEkG4EwAdpON1ORdgXiywwG8TfqbkuMAF65hLGfGnkpCeAusYBf6J57QgFLe2mOdVsX
         AbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgP11tRBBa8Q1XgF1h6NbrrQElUHoLq/lzbovJCOibE2OtcXgg2QYKom7nHe6wgt2QVMbD+3saETdNwyGwR3xZY6K/CkTxe7IhMcg=
X-Gm-Message-State: AOJu0YwOvvIeANIDLqS/RVGArkNnJRbnoBFA+CKYYQhY9qQnpgeriBqp
	hSm9diHUX79Luk2hZegu1mlhZrPLUJZF95yJZ8bGRBsrbS+UXxI1bUENt/AGcw==
X-Google-Smtp-Source: AGHT+IFY3HpnXZqVO5RN+MBkj0nT6txi3QTEXqUsM2tgW+Uu/31vipGdaTf50VCJVOULUS9aTEJSog==
X-Received: by 2002:a05:6820:1c94:b0:5b9:d8f3:a8c5 with SMTP id 006d021491bc7-5b9d8f3aadfmr301026eaf.4.1716941212707;
        Tue, 28 May 2024 17:06:52 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b986920549sm1882010eaf.20.2024.05.28.17.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 17:06:52 -0700 (PDT)
Date: Tue, 28 May 2024 19:06:50 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/2] input: Add support for "Do Not Disturb"
Message-ID: <ZlZxmqMTHESfjgLW@google.com>
References: <ZlZeMVHsquYbQzGG@google.com>
 <ZlZgByQ3TlycC-A_@google.com>
 <ZlZpkrUuBonHDPaj@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlZpkrUuBonHDPaj@google.com>

On Tue, May 28, 2024 at 04:32:34PM -0700, Dmitry Torokhov wrote:
> On Tue, May 28, 2024 at 05:51:51PM -0500, Aseda Aboagye wrote:
> > HUTRR94 added support for a new usage titled "System Do Not Disturb"
> > which toggles a system-wide Do Not Disturb setting. This commit simply
> > adds a new event code for the usage.
> > 
> > Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
> > ---
> > Changes from v1:
> >  - Modified formatting to match existing code, ignoring checkpatch.pl.
> > 
> >  drivers/hid/hid-debug.c                | 1 +
> >  drivers/hid/hid-input.c                | 8 ++++++++
> >  include/uapi/linux/input-event-codes.h | 1 +
> >  3 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> > index 7749c81b6227..78b2dd10cba2 100644
> > --- a/drivers/hid/hid-debug.c
> > +++ b/drivers/hid/hid-debug.c
> > @@ -975,6 +975,7 @@ static const char *keys[KEY_MAX + 1] = {
> >         [KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
> >         [KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
> >         [KEY_ACCESSIBILITY] = "Accessibility",
> > +       [KEY_DONOTDISTURB] = "DoNotDisturb",
> >         [KEY_DICTATE] = "Dictate",
> >         [KEY_MICMUTE] = "MicrophoneMute",
> >         [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 1ecc5ad57b56..f023f51b9c08 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -826,6 +826,14 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
> >                         break;
> >                 }
> >  
> > +               if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
> > +                       switch (usage->hid & 0xf) {
> > +                       case 0xb: map_key_clear(KEY_DONOTDISTURB); break;
> > +                       default: goto ignore;
> > +                       }
> > +                       break;
> > +               }
> > +
> >                 if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
> >                         switch (usage->hid & 0xf) {
> >                         case 0x9: map_key_clear(KEY_MICMUTE); break;
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index 7ff6eeef1af0..c971d542e525 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -618,6 +618,7 @@
> >  #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
> >  #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
> >  #define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
> > +#define KEY_DONOTDISTURB               0x24f   /* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
> 
> Please spare a few underscores: KEY_DO_NOT_DISTURB.
> 
My apologies, I didn't see your reply on v1 before I sent this. I will
address this in the next version.
> 
> -- 
> Dmitry

--
Aseda Aboagye

