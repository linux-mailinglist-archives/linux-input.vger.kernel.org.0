Return-Path: <linux-input+bounces-13153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7CFAEC3AD
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 02:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00DAE564185
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 00:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A4A194124;
	Sat, 28 Jun 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLIpYTVa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFC63595B;
	Sat, 28 Jun 2025 00:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751072374; cv=none; b=u6ojdZFbNy/1qB3/qBg7UvRYYBc2tL6hEAC2NUYBaFfmNd3N2jyZlZc33POAmzfAfjZGjeDm3xaShzbqpYdYnjEdSmb+4RLV8IITDy81x9ROFWSx6CSEugFNvVeVbIOxFGe2zBDTbdt3/0hByAEIPZEZX4Kqk65YNZonK1kfUlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751072374; c=relaxed/simple;
	bh=HpWrrf8Gn6Gyqh+K+uViIYoXI0Q2VMcjD3NgY74uW08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMIO9T9f8h3MChGqvwzt8UoGzeEOqM4UoPkeMhe0wEpHXJxBPDmmgBcol6s88m1HsFFc+4wTvi1HJgsVkLtiNM0gfwi5cBP6oYXlVRDkj9uLhJ1iGgABXtI6tXmjiU0/BXUO1UXDxYRl7gX3CS04wlSY0lZHXzh28X4C+eo2R+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLIpYTVa; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234f17910d8so25048205ad.3;
        Fri, 27 Jun 2025 17:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751072373; x=1751677173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UAiWn8Pi1tnpIPR4P9XJoko/ztItX7ideDEdvEYdzk=;
        b=lLIpYTVaI1kQyhrEk0UJBTjb6CYDhCBymqTQrR1g9U4RTVacn/Vhx8VJ5oRlfrSjcc
         Bxnfo4qlMUmfrmwK7jLhztYmeA75g4u/tWtriG2r5fmt5oNYCTH1BFrO/iDks7Be35CB
         /xT5W3LtyMmLzDKyBeU3p91lLZKEuKM/BXdUsb5H5RZcYAscuHwbD/LHmythm0xDIjvj
         AabMhwyXvuKfR5+p/Xeor5gSJEqFL9EmAv3of7K9/v410u00aZTVl7t6IrFzKC1HYNgW
         GvjT454E7RBPn8FK8QbKsz+wR8nDRVm3YlNfBd9ReBnN2UJZ8sPq/QmoUXb0n7OkMUaW
         FS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751072373; x=1751677173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UAiWn8Pi1tnpIPR4P9XJoko/ztItX7ideDEdvEYdzk=;
        b=IOvukrDxYFUIDWLcgiFSOwHxbPR8O0NOiFuftHVbM9p3YR5fLJpBBBBzO5e+U/6hzV
         ZTa0bNfGRmZjem4BD2sxeLKaOTe2k5NcDe0l07Z5IEKYsCs/Bc1jrUMJLs0D7Tf+gbnr
         GANE7DhlVe/CW4KvUQsFuKPqfN5hOr/UIGvn70W2Qai528hFh2G4T48P0tA8NW1iz1Hq
         8sK7Im86FOMOgzxaw55KLOAbZDE/fNwgdW6HcNxaBc3k1vFSgIayDOBcTZtYEWPTqePH
         1bOzpaFJxGCD16vDol5paYyBvUY2RoX5O75fZu++wMx313ze2N4clkwo69p9PRG6czzu
         ivyw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Dtdt+F7qb75afmEwxJdxa9+WOxBHo6couOPerEmopJupQe4LFcgswaR7U1VShm+Riufx//Pl8Qs8@vger.kernel.org, AJvYcCVSfHjmMIn6uMoBCR4CowoazR5mwgB7iuQgPPGW9dC+35DAr9Ooj1+udvQ+jfofnuURoJE4dplAJ6O2mQ0=@vger.kernel.org, AJvYcCW7YWE054Buf0e+llONsUPTcwL/7jjglXmN5ASheJV3RqPvShyd55DKLtVmgpVIzyE/BVdc9NW3nsr+noyo@vger.kernel.org
X-Gm-Message-State: AOJu0Ywze64aLgSb80sN95QCboT4riSDJsCeS+Wrk/PeX4/QmO4TatSA
	BpBlpXO/Neahnp1f2gTNkKuGPWMnMDBsdN394lIwYFnrJiNKmMLF1oHA
X-Gm-Gg: ASbGncucMAaz6ICk1okRLAwGKFSrVtNoDShN2/5D9nEC6eM+AGx1TulI+QtS83XdUrs
	QEOI4id0Zf3lVc0qZ1RBhVReiSrLM22JyILNvAFQXO2d9B9c7zXaIPyY7STbwYbfNCwLiuDIZ8r
	OvgNBXGz2WHx0nZd0mnFEWZh13tvStGjph8ZNPPWdUjAVZzyr5crkpLKyM/v4Cqnbsa29vfgwrj
	sbDES8vR9MBaXuZ3xCendZjRMNj2Z+hTiX6owZNH9djkXrbHqXMcJtQZ6RJlpHTAKOsafR6zTR6
	YgwDTtXbTdZRV12Ok0uYzywjEwIMxhJncViCtIqdk1prmLumaCeB4S26FvqzWQ==
X-Google-Smtp-Source: AGHT+IER8/+9/mIH4JWCr3PocAX0QsvyiFc1zROda2UNkXjcMckY1zi+itiyjtz9p4IRpOfqlqJ/JA==
X-Received: by 2002:a17:903:32c8:b0:235:2e0:aa9 with SMTP id d9443c01a7336-23ac45d5f4amr79376735ad.14.1751072372489;
        Fri, 27 Jun 2025 17:59:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e39f7sm25732775ad.49.2025.06.27.17.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:59:32 -0700 (PDT)
Date: Fri, 27 Jun 2025 17:59:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
Message-ID: <fw5kqv74vubn5wiarcq767v3aalxnoc7qosg3ao6gchijp7d5w@37vkon4mmnwh>
References: <20250625163431.2543597-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625163431.2543597-1-Frank.Li@nxp.com>

On Wed, Jun 25, 2025 at 12:34:28PM -0400, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

