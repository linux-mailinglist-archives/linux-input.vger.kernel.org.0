Return-Path: <linux-input+bounces-12937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA3ADDD70
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 22:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60BA07A7AE5
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 20:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8E428505D;
	Tue, 17 Jun 2025 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsKW3MLK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1CD1A5B85;
	Tue, 17 Jun 2025 20:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193426; cv=none; b=uXrwRVzKJ6fAD+0wXM7IlTs8T1fzqJn8Rg3GkHCVnp3p5X4Hp8n9LDXNPWzPWgQnJD9x+FmRJ/14Igx3ZMW+2bMtqQynHWwoBIyoPK9v6+tJT0YJy41jj09JtoCNOXdneenR11w+uTzNYuFTUY05z5824idJyITrfa0qTXEEbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193426; c=relaxed/simple;
	bh=g/GbFLr0t0FFhIa9lCaetd6TAcEePslVG0jAd/7FErs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4M3/gLSrVnoMq02QqTWhYabsMXYpjcJOsgSJrKm7gnMmjxCevCRMkWx4JQgGWAo0yVQOSjAhKzKFsXiuktZVsfNBtt0YbrnVs3wfUUh+xIteTAjhb6ASl4BT5l7qXv2QMHShfHYenEny/e9Fux6ucvVk22zmhhcv/SdAbMKKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsKW3MLK; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2366e5e4dbaso744645ad.1;
        Tue, 17 Jun 2025 13:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750193424; x=1750798224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdC0jnMM0Wp1N4Pp8HnVWBb6JU8nK5caKJXp0Tz/SM4=;
        b=dsKW3MLKwVxVdlvsjJv7Bvp0PE8BafAcEVcukeoEZvOVsXum7p+HtXrPVoAT6YWog5
         lBgzJMx7pNxzsSL+sG/kNYmyrE25LqA+wloE1K54evIgthanbiJ3Hcyp98TGIf2Q2xL5
         /uJoL16EQfdXE8LN2whHhczs83/+6B/zf4inqOHhJ2fnU26PwDPbO3YF8G1vr1q3xitB
         pTcMemZ3d38PovbQqNxkhrUsJUJ2WOAwvkf/u0nPMMHsj6RP8jEikLJmhIhBB6r8PEig
         hCeMnFTmf7pdQCSt4w9v9TYEayi9+JqQTWhXTjYL6n5aE/3GVCpNnY/fSbW2NnlYErx6
         uhmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193424; x=1750798224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdC0jnMM0Wp1N4Pp8HnVWBb6JU8nK5caKJXp0Tz/SM4=;
        b=tQQJJIZQRSPoB4rzw8ghg7TrJkGyowVE3DYxCcP/uZDPPNQSre2jXddOxXCv4nRf5y
         OoeNlBxUS/XI+daCwQDCypRcO/joOlzlpaHscK3EK9jMD4qpQEXbQSl+3G4JG7vJOyXV
         D6/3VrxVYS2idW978g3G+chjiASNmdGgZuxQqaBeZRVesvyCcppPK/shnIlN3Lsc/SP0
         uI9k8rvM/j5bFSfZDLNRLuumfVIxNTaRc2HHz6N3tmNK2WhUh4qW+KHgp+G9QIwavd8a
         tRe4TQ2L/n0eRIPILaTCYq2kiHYz8fv+TxF3Xkof1Ko9Z0MDn30DbeNzFtxqzrTyj8Cd
         pfdg==
X-Forwarded-Encrypted: i=1; AJvYcCWxs4rUrDpVFgtb8ktZg3exshlXaR2ej4uV8vszMRZ3+wOc3tM4VYIvs9Ce+ATJ8inSd8MwIOdPtdkXYuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQW2nAEyHoD9ecitEIqhg8DUZfuV4qER3D3SXlLMHlYbneRxbV
	FmS2oCd1iBnC9Jsti21nzSdQL//ScvQulJn3FauUGrg4NrSo3nq8XsXU
X-Gm-Gg: ASbGncvctTdgs1cAVy6hAcgVbMn4WyW3BoR+ZFLDTDGVB0DLF6K/vYPV+ZNnc9DbwK+
	1xtqnebTsRhDT85Dh1nHI8rHzD7v77qJrHe68y5FoPEn/gKCFRGyWbzXJZ1+Qm5N9Rrs1KePtK3
	KaAPQ0O473cdf2yzchmqOu4icsIuycmegLcpZfkeavC9dc7z4WiIwBMPS+MKOhERiQDfMJVNabr
	3YeTyxBDeF/yJ6FIgJ0FzO9RFoEkEjaGN7xKDoeF0FeiMWYGmD79SSnL1n+Ek60Ih9BlGZWcDe6
	tj2tZDlrFz0+y02ldrNrNJmomZnZ1Pwajley2vYlMnBAUouqHN/H3zkfW/a15HM=
X-Google-Smtp-Source: AGHT+IEdOfXJMnWFu+/Ukhgq++wQx4ReIGb7Y4+lEWZJg1AMq1L0mJklB6P5+OMRQTWTHJVcRpbpBg==
X-Received: by 2002:a17:903:1251:b0:232:609:86c9 with SMTP id d9443c01a7336-237c204e73cmr431545ad.9.1750193423987;
        Tue, 17 Jun 2025 13:50:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8d7d:9cdc:2836:83cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c061sm85269355ad.1.2025.06.17.13.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:50:23 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:50:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add nokbdwakeup quirk and enable it for MSI Claw
Message-ID: <5isz34mtyxezwrhmvtedygszhhnstsqa4dmcttb33p5dgw47st@3n6wswp2p6di>
References: <20250617051930.3376981-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617051930.3376981-1-matthew.schwartz@linux.dev>

Hi Matthew,

On Mon, Jun 16, 2025 at 10:19:28PM -0700, Matthew Schwartz wrote:
> This patch series aims to solve an issue on the MSI Claw, a series of
> handheld gaming PCs, where their volume buttons will wake the system out
> of s2idle because they are registered via an i8042 keyboard device. This
> is not expected behavior on a handheld device that lacks an actual
> keyboard, as it is very easy to press the volume buttons while handling
> the device in its suspended state. 
> 
> To solve this, introduce a new quirk based on DMI match that will disable
> the wakeup property of an i8042 keyboard device and enable it for current
> MSI Claw models.

Why does this need to be done in kernel instead of having a udev rule
to toggle this through sysfs:

/sys/devices/platform/i8042/serio0/power/wakeup

Thanks.

-- 
Dmitry

