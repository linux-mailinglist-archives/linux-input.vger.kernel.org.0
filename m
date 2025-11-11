Return-Path: <linux-input+bounces-16003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76289C4D67F
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 12:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 275F54FE751
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 11:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD432F90DE;
	Tue, 11 Nov 2025 11:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b="k0pL1e/T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB29734CFA6
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 11:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762860219; cv=none; b=T2Rc8twI5waP0+EiB6Go6zVi4BTizX4P3jdA74WlXmX2ZFUNJ9fliei+4JW9/LYDxAr+khEy+F6HtsAf8GvYLY95CtX2vhelBudBAemi9sU/S80V8HNDnbvP5sD1DLGYZBbbWWXbxYegl8d9n8JFW6ASzZ+MZCqUPvMXHBujuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762860219; c=relaxed/simple;
	bh=H0LINo+13Z/hJytF0VdChjfeCAxAHISX2HNxfIyenMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6YgctzysfOewJj3NsAbS1DwnRhvK/erg2t5Tl2qrMhIuBbP2u7SyIXZMxPQbdW/wUh/5za12Y0W5iKccUu9O6CguC1G2Hx0hHrwxteZbuYCkyGLfosupzFZhB0r5YS+Al78vLZyhpxdAlt0nbkZM3FHKt+29Cc3vturTKIsHU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20230601.gappssmtp.com header.i=@cse-iitm-ac-in.20230601.gappssmtp.com header.b=k0pL1e/T; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso2286481a12.1
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 03:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20230601.gappssmtp.com; s=20230601; t=1762860216; x=1763465016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WD33dFwh8vT0qTWS1ypf3i1K/+5CU5E89Hi1vtjhv9s=;
        b=k0pL1e/TctlpQMM0EqQMKgj3Uq7XW6PD06Ts9TjxFLyBRnOkDliPKPHGHGKBFwiuvr
         aOP8vy4btcG2ih7q9fH2XReo03+Vwm1tD1h51QPmoAbMnGpBKMHQC+nfQy2SU/ZIGI2M
         BXl9QRTgMYEonJKSKbHwc5bMvImLNTNj4q/hd3oFhw3VntnQTGyQ2lAk0an8BM0Zvve7
         f5PQ5NcjWhCcrV8YsiLLYSGPa6laJ8cJnrnYrL6Eqyzn0nQ7K4Q6XZbSBNamCO4KadTk
         VjXNiOt9KZ3utaxpQMuf53+RMcKIAUXj9eBonzR3+E5sM+Gf7eowa2XT+I1l/IvpSktW
         3Tqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762860216; x=1763465016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WD33dFwh8vT0qTWS1ypf3i1K/+5CU5E89Hi1vtjhv9s=;
        b=tmQ/5dPh3pf8nB62wVs9r75g8CEy5SjWmTtqM7D2GYtpCXCggvWN3ydFj1va3MjlnQ
         4BT3lNsNXcwRnF/zsOysmLsYW/ksGTTRqEwhQa4AXeefCMK2ZZP8lxeyhsnIoX4SNYuT
         eSHueJvxTYq7wuAZL1tc9+DWeWHINJbl+M19X+I5wnEn/8APbUQLjyHpp4q0ja4l4BrM
         cMRRw7fHnmUiKmKE6FiCTMAcyzyJDq8Kkrv12upbfVM5/f2ykUPjfEtRZGT7/q3yqN0s
         5Nul5ggVSJY2vfpwG+/pYSNhyUVgZ+3mWVwmqQVV1CAnkAqkvtk3DVL2RElH9yyjtZ0v
         cBQQ==
X-Gm-Message-State: AOJu0YwjDw5NqNM6ULBxyJj+yrAjOYn9y838UFmUanleycuGT7Ly5XQN
	JT3wlx+Fms49DmNyNDgtjr8r5Vc5yEjswS3oFtj8xoGKBjtkSTETSZAKh55rObMUQZO7peh0R5Q
	B6MJLmas=
X-Gm-Gg: ASbGnctQ1ndbBFwaF+Y19ZTRkg5SGGkCami3IqGTh3s9NywBRP78r5xBxsz7X/5mxlp
	XACVwNVlIP/If6xUqye9TBpsBDe83pqL+3IH8hmnK0tY9O6zLol4Ou5RYhP5XNmFjxhgG8WA7/k
	htfF8D4Zltw+nglD96ZoDX//BDCoghzjy484hpGYh5Cw68AdEUZBfeHHEsNoSInfmiImzXEYljx
	AOSTEePXt2t+Iz1AYloPvEyg3h4AZWmKHOnUVTgnWB6mknjsG+vW7lda8/OOapFlljxS3ppFO1N
	q3kwo+7WSLyca+b/V6qAcO05sqyNIyRRdqj1sPo8dJqiggPUUJ2P+yZE4LwWVtTwK+TdJXaiGJV
	7wUPk8uToPVAUMybJcOtA7Qn6BzfcCniEcgdQm10Ja62rFTtpb/59w0nnFQgA2+DB6kOgvShsyC
	8OJw==
X-Google-Smtp-Source: AGHT+IFboiQwYKl1ceB9F9QcGU+lPkaQ7+H951dK4YY2Nct4gKPSC1sT1xivKHdw2Ucy5iBM4bT6wQ==
X-Received: by 2002:a17:902:e888:b0:294:621c:a84b with SMTP id d9443c01a7336-297e570af71mr137445685ad.56.1762860215901;
        Tue, 11 Nov 2025 03:23:35 -0800 (PST)
Received: from essd ([103.158.43.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343c4c0d69esm1183598a91.3.2025.11.11.03.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 03:23:35 -0800 (PST)
Date: Tue, 11 Nov 2025 16:53:28 +0530
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-input@vger.kernel.org, 
	Roderick Colenbrander <roderick.colenbrander@sony.com>, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] HID: playstation: Fix memory leak in
 dualshock4_get_calibration_data()
Message-ID: <gwriiuvepzg6zdmrpzuswvpcplxtdobhagmgs67325ioesqm3p@5ivtfz7ob2mq>
References: <20251110171552.95466-1-nihaal@cse.iitm.ac.in>
 <cc4923d4-a24c-47ff-876d-0fddc0b8ad1e@web.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc4923d4-a24c-47ff-876d-0fddc0b8ad1e@web.de>

On Mon, Nov 10, 2025 at 06:49:01PM +0100, Markus Elfring wrote:
> > The memory allocated for buf is not freed in the error paths when
> > ps_get_report() fails. Free buf before jumping to transfer_failed label
> 
> Would an additional label become helpful for this function implementation?

In the function, the code present at the transfer_failed label is shared 
between normal and error paths, and is not the traditional error path label,
that's why I put the kfree for the two cases immediately before the goto.

Regards,
Nihaal

