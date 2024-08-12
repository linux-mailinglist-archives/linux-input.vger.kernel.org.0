Return-Path: <linux-input+bounces-5523-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0F94F5C1
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 19:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B8611F21AEE
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 17:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B14187FEF;
	Mon, 12 Aug 2024 17:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2Hck6pV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2561804F;
	Mon, 12 Aug 2024 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723483472; cv=none; b=Fg7WpgY1zKkHUbTdmewlUZLBUYDHbi9HOD0xUiqdx3jvxHMyhnhjLF7WYhliDtO+CojLiB7JuyS7zYrsKzsqK7GYHzmh1hDe8d4stwFGWGMQd+ptrOp3j6Yqyty3w+qh1G/Vd89mAZp2BdaOJP5XqdLyi4qvj5uDTdwYu2jxWv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723483472; c=relaxed/simple;
	bh=5jZeQ5eXrvFDGomDdB8EzElaHLWT/JmDT4aHgfhv/cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfSVxSa79c+Gmk6+PVzCbJnjgogXDsHE7D+B7Du1dpRX9Q8jZyfUk8Zr/sCBWyRB3QRB4UmBzPmXF6F0GjmDU8uWpNk+gAF4Rt8XtedwiZoY5UlGBNrZmjHVr0bd7GU/R0oggTBIWG0mnZJl4Yn9iWGbRuCeZVPNYpZumTveQww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2Hck6pV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7106cf5771bso3518179b3a.2;
        Mon, 12 Aug 2024 10:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723483469; x=1724088269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SPVHK86SfmYR33I8cij543XtB3addk94LL9gI/hj6q8=;
        b=Q2Hck6pVp6t0w2BW9ZvNF4AZWNWXToyCJG2w3N0shbcOmQj6kHJjMcyTKBE+cpPVF9
         duSlvwXLAPc4Ix0VuCHdvkUtg01FBUM33BMxm/81nb/OS4k7RsiiHbETZA5OBNFSdkm0
         zSazhZMHZkS4oBYOdAnFauxMSawzFG6XEaOYNgF043/JCPLc/knAkWMIMpzJQ0oqsrP2
         wzH+UjW40q5p9Ln0nNpgdAq4OxAsKN/YQRSICkL0rgaGgi4WscCQaUao47Echb4ss/AD
         8o89Iqdm9JZSJrcCSWgVBDBuvuYv76Mgiz83k+6cQ2oSQx1CmKJ9GjsEypJ1Z3ZsY4XU
         Imwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723483469; x=1724088269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SPVHK86SfmYR33I8cij543XtB3addk94LL9gI/hj6q8=;
        b=N58lPvmHh7TgaIHKvdBhU57hfWwIT0ZDDz66Fbh5jAj5FRdNbTMgCLSq++O5lRlUOL
         yhWZ46+cGxEAZ1yrO2PVkwuZImAsqWZBnyEKSLmeDETgmXqG71JGBSdKcTugBiFqupQC
         Rs5w44xJ/0ioaM4OM8+raXIIG8Tr1iVHRJt0yJR34D+Uknf7Ja1lE4dlx3Y6S35JUGS2
         bzgaUUWAxDuC56F6We4HE5BWRzoyEvbDSI1Xhwgh40UGG6fQJleL6VYDDfwmWCvgl7kc
         P/d4EM0xWa3/3R/yMdHM0kBdoUoBP3bESfE3XNpotP0nvciygXotds9YmIi3Y0ejlKHH
         hKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI5BbZTzvtDBLsfX1xY70uY1foreFQfBi0AeRhEASaD9fJx/roV4LvYrn8uvfksqzl3Z5t0HS5+PZN2L4Kgd+rKhmiYw==@vger.kernel.org, AJvYcCVFVEMg5qrgqqa+5XDxmcFk4HcVIaM1vh86Jdh1mO24QdDItPPCuM6QxIs4L46JUBDY4puveQbpbMwq/A==@vger.kernel.org, AJvYcCVxP6o+Ajb9Zg6lYPS4WHNosQZmjqDNnqkl53IsbIo452njvasK0VSEEHnXCfsCi9bVSpu5DB1r@vger.kernel.org
X-Gm-Message-State: AOJu0YyHqNaYaKrsDBNOrl8VrHCjK0QOM09+5yYW2ZWPU+UCvZ2LVtLP
	z7vK6uEtEYMwdLfvaQOUhpfnQpayDiFwMZCEgBhOHWoA1kN1YNuq
X-Google-Smtp-Source: AGHT+IHLAqh7wd/7W2tSnosvyd+Ten3MOh/zNGSfalDpXsylxvzi1fXRlb6OlopSnhYDV2CG8RyBOg==
X-Received: by 2002:a05:6a00:3a26:b0:70b:2efd:7bee with SMTP id d2e1a72fcca58-7125520be9bmr1155179b3a.21.1723483469310;
        Mon, 12 Aug 2024 10:24:29 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:53c5:10b0:cfab:3972])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5874d01sm4415366b3a.16.2024.08.12.10.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 10:24:28 -0700 (PDT)
Date: Mon, 12 Aug 2024 10:24:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>,
	Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZrpFSnCQ0T4_7zAB@google.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
 <ZrDwF919M0YZTqde@mail.gmail.com>
 <5c5120a7-4739-4d92-a5b8-9b9c60edc3b7@redhat.com>
 <ZroaE5Q6OdGe6ewz@mail.gmail.com>
 <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80dc479e-33af-4d09-8177-7862c34a4882@redhat.com>

On Mon, Aug 12, 2024 at 04:41:50PM +0200, Hans de Goede wrote:
> Hi Maxim,
> 
> On 8/12/24 4:37 PM, Maxim Mikityanskiy wrote:
> > On Mon, 05 Aug 2024 at 17:45:19 +0200, Hans de Goede wrote:
> >> On 8/5/24 5:30 PM, Maxim Mikityanskiy wrote:
> >>> That means, userspace is not filtering out events upon receiving
> >>> KEY_TOUCHPAD_OFF. If we wanted to rely on that, we would need to send
> >>> KEY_TOUCHPAD_TOGGLE from the driver, but we actually can't, because Z570
> >>> is weird. It maintains the touchpad state in firmware to light up the
> >>> status LED, but the firmware doesn't do the actual touchpad disablement.
> >>>
> >>> That is, if we use TOGGLE, the LED will get out of sync. If we use
> >>> ON/OFF, the touchpad won't be disabled, unless we do it in the kernel.
> >>
> >> Ack.
> >>
> >> So how about this instead:
> >>
> >> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> >> index 1ace711f7442..b7fa06f793cb 100644
> >> --- a/drivers/platform/x86/ideapad-laptop.c
> >> +++ b/drivers/platform/x86/ideapad-laptop.c
> >> @@ -1574,7 +1574,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
> >>  	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
> >>  	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
> >>  	 */
> >> -	if (priv->features.ctrl_ps2_aux_port)
> >> +	if (send_events && priv->features.ctrl_ps2_aux_port)
> >>  		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
> >>  
> >>  	/*
> >>
> >> Maxmime, if you still have your Z570 can you check if the touchpad state after a suspend/resume
> >> correctly reflects the state before suspend/resume in both touchpad on / off states ?
> > 
> > *Maxim
> 
> Oops, sorry.
> 
> > Just a heads-up, my Z570 now belongs to a family member, we'll test what
> > you asked, but right now there is a btrfs corruption on that laptop that
> > we need to fix first, it interferes with kernel compilation =/
> 
> Note as discussed in another part of the thread the original bug report
> actually was not on a Z570, so the whole usage of i8042_command() on
> suspend/resume was a bit of a red herring. And the suspend/resume issue
> has been fixed in another way in the mean time.
> 
> So there really is no need to test this change anymore. At the moment
> there are no planned changes to ideapad-laptop related to this.

I think we still need to stop ideapad-laptop poking into 8042,
especially ahead of time. If we do not want to wait for userspace to
handle this properly, I wonder if we could not create an
input_handler that would attach to the touchpad device and filter out
all events coming from the touchpad if touchpad is supposed to be off.

Thanks.

-- 
Dmitry

