Return-Path: <linux-input+bounces-13120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B10AEAE64
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 07:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 485A51BC741B
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 05:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C5681DE3DC;
	Fri, 27 Jun 2025 05:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDezvZ+M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0322F1FE2;
	Fri, 27 Jun 2025 05:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751001270; cv=none; b=tImik74VErPlXFiCMFa6zMlR6ymfd2/xxmql13xhRHqwYsxzlYMQEarnCr7oY523X/ptTMcRJoX3BtercxIAv3ayP7aHGuyF2/l+29pPNJa5k6HaIAG/QHchQbEKvdcSaTZ57SIIfKytXzWVKlAQ+cgCkcMPj5Xnpka+FiTyh9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751001270; c=relaxed/simple;
	bh=o8ZQHp4/hDL23QfIAn8Wt8PvTC8gS76JqKcuZRP/FWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gX9lwNIfxMz06mF2C4p4/BvKC4cMAZrgAvuKsfQ55d7Is03KaPvfHUMrn3ly78das/Tt3cR26S+CFbxyzbo+G3yc0odD2WJ6yfI5kKofOrI4tN2/joqIm5UHNDOCvEAlYzQ0tNPkQk3Y3Xk/83oKFgrEFS4DLfVlf2qLIYeVuH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDezvZ+M; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73c17c770a7so2078592b3a.2;
        Thu, 26 Jun 2025 22:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751001269; x=1751606069; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhc4F3bUMNlVYBI4FrEiquw9o4SRTI6Gsg6n63VV2NE=;
        b=nDezvZ+MU53VusahGb1HXaZQTmswJItaNOSdH4ZpPgbdzFKE/oAYR7TzH7q9WpovYy
         vzjNZ1j6prJ0Pi9julfCo+vLwJjBaoDxnUxWQwEm8zSaF5sDSx2/oyujtBXZgjQF2wrH
         AO2bR0M3fZLq2pINmhgLM2+SJHrTMu1qOsTi7nWc+gwKSwNsd/UFpzwkuTcU0h8byhyy
         7tQOFGivXQogOzuns3Ig55MuPBxYVK4dJlbkyXpkFOqLjp9Ked1iN+Z7kSqhFSzV5Jt+
         kqKcpL2inzF2IET51B4CPyEfH0NBeB81mvvMwBq2FGvcpoGg0vaIMdN6M+zFMviwxu/b
         f5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751001269; x=1751606069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bhc4F3bUMNlVYBI4FrEiquw9o4SRTI6Gsg6n63VV2NE=;
        b=nCmF91UvrUTMhMWaLeijSzmwvhX1Njd2l91jCkO4Jk34itjeh1ZhXIWNuEj/a2Sn9f
         qzbizkW/1LP6ENXAIUCPVNvkKbOa39fc3a7jinHlS3Pvtxpl7UE3a4uI9JFSSrPPN+sV
         88cNBvnoJwMbNeo+ZhyKw0yvOgHLO7FLS1/1IeBTuGyw4/3LuWsQeYDWPbJIHy/lhL4t
         le06YwfCjFqW5FMddHA8bfF5pNtrP/Tc5/Ze6leXYl67q2mUjGUFFMqM39/tpQd2efUs
         thcoHs7XgaBc7HH/jMmleEG/gyX7kaObkyYe7E4PVDMEvfJxWau37bfONnOAkdvGXb2n
         83gw==
X-Forwarded-Encrypted: i=1; AJvYcCUWsPTmPMvsRQG5lKNIhCaSJR25jjjWU3H5lePgqr7RUGyuVOAGrh6RJaD4oV0GcOemDtqhlFbbrTqoA882@vger.kernel.org, AJvYcCVs9TS2r5pCiPc1HM4rH3eB+RBYlovnYCVlWPcGkVOl31wybRQzi5wOjoEyCQ2NUBa2FPQZHMzbd5T25Q==@vger.kernel.org, AJvYcCXoUT8/z1aYLXpSsTe3mqbscb1WsqWiRZrfbrGGCoMZXHV2Ocif+GbwmJLKYSivo2VAkYnNWKqnZ8t4arZxD21YDCEQVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypXmkqyzDrXM0iquCyThmJSv95sWfXQcxwE2+tb+7O4bKp6HH8
	E/05X74inSXb6YpQO/fAvB0h9QfTjhzNBbTvvMvMfTjum7wx+K7f+81Q
X-Gm-Gg: ASbGncu62on+inPuhsm2YlOqEJ+zTRMJ0Kqcvo/BUUi+jy3wbULrp32fuBWm1+tn/wv
	7u3AUTzCNJM1H+kwUkECwbZ7KWylJVgdyhoedAV6MqJRqWvauCQZTME8erT88mUNxa3y8848xgi
	R5BNdE+zUidlEuy/Tiy8o5qb2aXv15e4iKeIJYgditZZMZ62zSDjVoyDlESN6aGmaVAcMhDNBRd
	8241ub7VjthGWuAErV3+qQBsaAieksJrRKRkcFF7TpGoGJhSLTOEo4/hkZMtwGT8R3LPeT8Pxpo
	chLZFR0KkFQa0v7LwEkQA/MViJlee7SeKBaIBFYp1LjGGZQLLfs6nNjXuUoX1Q==
X-Google-Smtp-Source: AGHT+IFXEsyBMb/CAdGfjgJitTkGAT8Tvs9bfEcnJN13gSVQY2QQe/8p4thG2wM4PAe2ueMPgyt9Pw==
X-Received: by 2002:a05:6a21:328c:b0:1f5:931d:ca6d with SMTP id adf61e73a8af0-220a113ca68mr2413528637.1.1751001268908;
        Thu, 26 Jun 2025 22:14:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557b3adsm1228434b3a.106.2025.06.26.22.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 22:14:28 -0700 (PDT)
Date: Thu, 26 Jun 2025 22:14:25 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: pali@kernel.org, hmh@hmh.eng.br, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, tglx@linutronix.de, mingo@kernel.org, jon_xie@pixart.com, 
	jay_lee@pixart.com, zhoubinbin@loongson.cn, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH] x86/Mouse: thinkpad_acpi/Trackpoint: Trackpoint
 Doubletap handling
Message-ID: <5jgix7znkfrkopmwnmwkxx35dj2ovvdpplhadcozbpejm32o2j@yxnbfvmealtl>
References: <20250620004209.28250-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620004209.28250-1-vishnuocv@gmail.com>

Hi Vishnu,

On Fri, Jun 20, 2025 at 09:42:08AM +0900, Vishnu Sankar wrote:
> Newer ThinkPads have a doubletap feature that needs to be turned
> ON/OFF via the trackpoint registers.
> Systems released from 2023 have doubletap disabled by default and
> need the feature enabling to be useful.
> 
> This patch introduces support for exposing and controlling the
> trackpoint doubletap feature via a sysfs attribute.
> /sys/devices/platform/thinkpad_acpi/tp_doubletap
> This can be toggled by an "enable" or a "disable".
> 
> With this implemented we can remove the masking of events, and rely on
> HW control instead, when the feature is disabled.
> 
> Note - Early Thinkpads (pre 2015) used the same register for hysteris
> control, Check the FW IDs to make sure these are not affected.
> 
> trackpoint.h is moved to linux/input/.

No, please keep everything private to trackpoint.c and do not involve
thinkpad_acpi driver. By doing so you are introducing unwanted
dependencies (for both module loading, driver initialization, and
operation) and unsafe use of non-owned pointers/dangling pointers, etc.

Thanks.

-- 
Dmitry

