Return-Path: <linux-input+bounces-3922-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC77F8D2948
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 02:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDFA51C22BCE
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 00:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E6A7F6;
	Wed, 29 May 2024 00:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gw2LiM9B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DAD632
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 00:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716941337; cv=none; b=BxPJY0XJF/6fyC5jFdipzTZcADzUFC8CuajUi01XPX7WMzdVPX3trOSP5GAKlctJLf3RH5btpO14tLJu/l8V+7mVf0UYo+TFep9Wdpo1ZyFWa3xC7Zfgqzx5K8eY31Lw40RUE67+c/t5ck5MFG7MAFvaqR+EnY3TZX1G0gIBDHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716941337; c=relaxed/simple;
	bh=1isXNV0l/RJw8bu4rRBsKj2ii/RVuBQDxj7nZRMYOiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oq1i+TtumOoFJ4FWVghyzpESVNF1jPl0ojvs7EjZ+QfPlVE1/DjwlZGWJJ6Sqst9pc7Cb7sividrEbRDiHCdJZlW7hvfpibkK5eH7uUbZjwItiPfl+AVbiNv1A4L0Hp9LsO7neeNNNst0aIfKpllJZRB5eifMR0hcQhWIx+Lhl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gw2LiM9B; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f89b16d081so765640a34.3
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 17:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716941334; x=1717546134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1FJBX6/o3NvmNxUeMUe9vIKt4KVoLfeCSKRe8yQXEs=;
        b=Gw2LiM9ByJRA4kPcnyW89tEUCFLGj8S2a4PqvSbJrFhtbVN4BkIsEbZsYsRbwtNSkS
         acw6Dq25Z7PxE3OWfVXe+obz3GEMv1YFxJTu7PXTHi0eahvkftA2NIutGPdeq4Be6DE8
         e9GUqrjivR+N/2qh6/fSLQ7b9RdOdd9Q7OQCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716941334; x=1717546134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1FJBX6/o3NvmNxUeMUe9vIKt4KVoLfeCSKRe8yQXEs=;
        b=fpeBxvZ9PoN2XvWCdWXgCklrFNG6NwhZ+OShnAB8KGq+SZONLeKVvWhXCeARKFXfyH
         Mp59+qrVCI+N3c96sOrosl+4laVF/6BNFBtDd/IRFpJx1sKJfo43Y89PknNfJh2Gwpnf
         K8HsUQjJLcp6OIUtxOLpKS2fo3GbYp8Gk9ssSIlWeBIi7OfEygvP/9iSj2ptQYfz2vUE
         ufrhGCV3S0gnEPkZKK/qTaUT6WG1FjshBe4rCm8YayPEDSfwvDK1KZjbj7DAdkUFZyQ8
         uLbRpBsm/JxRSajIa+q1+vE1hzp8rgK+XKxfQMRjTLjqLs39X/R3V54fQz0Mp4j2nK4T
         0RaA==
X-Forwarded-Encrypted: i=1; AJvYcCXSrIaSsQDUZ7yQuioHeVH7SgdXXyrcZUqYYf4Z+8IWm8MwrIqmLb/67ZrQ080wSWcBlCfdGRd66T0d9vRoiHb35AJGJfn8H961pGg=
X-Gm-Message-State: AOJu0YyWvX+biD/MfyoLaUyENUfoMcho/TffBZOGDuB9epwN/BQAj6KI
	2Fhdp8H/qCbJljkdDyYsvfS13LQM5OvB58KH5e7cDQsy6Rw7IuasBN+ghSRuuw==
X-Google-Smtp-Source: AGHT+IF11monEjK7vUjJPC261zEFLHc5zATw+NldEZUaDuEH5YZL5vYehJfsUl2pMO8ALifsia3foA==
X-Received: by 2002:a05:6870:41ce:b0:24c:f8dc:2baf with SMTP id 586e51a60fabf-24cf8dcd0c3mr13213691fac.10.1716941334444;
        Tue, 28 May 2024 17:08:54 -0700 (PDT)
Received: from google.com (syn-076-186-130-074.res.spectrum.com. [76.186.130.74])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-24fe0a85880sm1949577fac.4.2024.05.28.17.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 17:08:53 -0700 (PDT)
Date: Tue, 28 May 2024 19:08:52 -0500
From: Aseda Aboagye <aaboagye@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] input: Add event code for accessibility key
Message-ID: <ZlZyFJCw1GF1JaoH@google.com>
References: <ZlZeMVHsquYbQzGG@google.com>
 <ZlZpN9ohRY-Qx7E4@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlZpN9ohRY-Qx7E4@google.com>

On Tue, May 28, 2024 at 04:31:03PM -0700, Dmitry Torokhov wrote:
> On Tue, May 28, 2024 at 05:44:01PM -0500, Aseda Aboagye wrote:
> > HUTRR116 added support for a new usage titled "System Accessibility
> > Binding" which toggles a system-wide bound accessibility UI or command.
> > This commit simply adds a new event code for the usage.
> > 
> > Signed-off-by: Aseda Aboagye <aaboagye@chromium.org>
> > ---
> > Changes from v1:
> >  - Modified formatting to match existing code, ignoring checkpatch.pl.
> > 
> >  drivers/hid/hid-debug.c                | 1 +
> >  drivers/hid/hid-input.c                | 1 +
> >  include/uapi/linux/input-event-codes.h | 1 +
> >  3 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> > index e7ef1ea107c9..7749c81b6227 100644
> > --- a/drivers/hid/hid-debug.c
> > +++ b/drivers/hid/hid-debug.c
> > @@ -974,6 +974,7 @@ static const char *keys[KEY_MAX + 1] = {
> >         [KEY_CAMERA_ACCESS_ENABLE] = "CameraAccessEnable",
> >         [KEY_CAMERA_ACCESS_DISABLE] = "CameraAccessDisable",
> >         [KEY_CAMERA_ACCESS_TOGGLE] = "CameraAccessToggle",
> > +       [KEY_ACCESSIBILITY] = "Accessibility",
> >         [KEY_DICTATE] = "Dictate",
> >         [KEY_MICMUTE] = "MicrophoneMute",
> >         [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
> > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > index 851ee86eff32..1ecc5ad57b56 100644
> > --- a/drivers/hid/hid-input.c
> > +++ b/drivers/hid/hid-input.c
> > @@ -829,6 +829,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
> >                 if ((usage->hid & 0xf0) == 0xa0) {      /* SystemControl */
> >                         switch (usage->hid & 0xf) {
> >                         case 0x9: map_key_clear(KEY_MICMUTE); break;
> > +                       case 0xa: map_key_clear(KEY_ACCESSIBILITY); break;
> >                         default: goto ignore;
> >                         }
> >                         break;
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> > index 022a520e31fc..7ff6eeef1af0 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -617,6 +617,7 @@
> >  #define KEY_CAMERA_ACCESS_ENABLE       0x24b   /* Enables programmatic access to camera devices. (HUTRR72) */
> >  #define KEY_CAMERA_ACCESS_DISABLE      0x24c   /* Disables programmatic access to camera devices. (HUTRR72) */
> >  #define KEY_CAMERA_ACCESS_TOGGLE       0x24d   /* Toggles the current state of the camera access control. (HUTRR72) */
> > +#define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
> 
> For input:
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Feel free to merge through HID tree.
>
Thank you so much for the review, I really appreciate it!

> Thanks.
> 
> -- 
> Dmitry
--
Aseda Aboagye

