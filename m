Return-Path: <linux-input+bounces-13265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F09AEE98E
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 23:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D87189F5AC
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 21:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB68A21A453;
	Mon, 30 Jun 2025 21:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CA4Oj7lt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7716D242D8C;
	Mon, 30 Jun 2025 21:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751319988; cv=none; b=biXxINyKfoxuvLAHzssAQSn4pFBrYuLJ2OUCHwJnAa9TSPpau7IW7KPwykD9pLyo2mzrIsJoqCu61UjOElq3J/F57O3bGrs5wtGDnN3r5xrZH0TlQyqkTZQ0qX6pGK78fsr0VoHaGXV0GUQoTEqP1x/cRL/Nbj0POvv0mcCWg/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751319988; c=relaxed/simple;
	bh=4tYed55s6+bCA/lfL1XquKdBm6MZag+ntnyZoH4OjJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNVBOb/rEreDRDvhlaY/XYcv1VkxwsC+5gq6TEYuFARUgCnq+lVJICT8u7Ov/SyIoiLehZPolamb5iAwVoChCCVbOa7kgDZHH56eFJDmKMnCp9InBlkqT/GjuagAH55SiJwUbipx5DejKGtiilHnzqYY+sE3qtIwKAIoDBZ7CTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CA4Oj7lt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2350b1b9129so15734075ad.0;
        Mon, 30 Jun 2025 14:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751319986; x=1751924786; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMzvf0inoVdnAwUYh7Qa8/sYrJIk/w5RMhrgarH2W2E=;
        b=CA4Oj7ltw2BrSo4BR/QSTe+03CwIB9zl7shCOdhu8CxtfuxB85eY8yW+Ko9cHszqFr
         mymbaZorq0DXHx465Uqm44fOTtKiSF4QXo+kknc8zNtwasHlRylFqsbHWbjueFezcf3Y
         hlKv6U/UNb9l0Kku0/Ph6d+cmY7iRfnf/U8wTNFFMsShvm+SIlQxHwZwRRdu2V5o0vS7
         X2ZJd7Uc7LdcuXcC43P4t0p5j46Ax0DqqbzkyG0eiaXD8Uoola8sCHQwRQfi/c2lNPik
         nHqZf1T1lzs5RDB5HPYTeMiYW+j88GnmDY58c/RIeJM2QBI8u0rPDXpWFmOgiuT4cTTu
         imlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751319986; x=1751924786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMzvf0inoVdnAwUYh7Qa8/sYrJIk/w5RMhrgarH2W2E=;
        b=i4eqpnB2EebJcUm976+OA77UxsTmbMcUNQ3QN+HiSTFT0dJ1WCCdFW8+XGOdZAtPgI
         t5MJoZafgFQXsrpq3xa7Hj3QMYTxmEBs3M+dyoZG4PHVYHDLLEgGybYQCgRKHu3/A+gy
         yiKNw4n/nBARPbxgo7FTkchB3jjCGpGxjmt8CTF1hlH7j+qbZUy9RQfs2R73l2JNVmqn
         erI47KutgZsuumETJq6Pl/sE0hvajeLQwW1xWNcowJ7t4EVQ4eUDCyT4bUC54VfQU1YX
         BFFCl6XOGrCn2n2X81WFyXeIDVkqj1fWmP290xh1lGK/VAbjLRZ4j0GfAgisL7L3XgUw
         2wjw==
X-Forwarded-Encrypted: i=1; AJvYcCX56mW/7qPeNDVRxux4C6WX5UJFy0LKxHZvxzd/DAUB0JL4jYGx8++JHIznsYGK/rClCBuxW5LPZfrvUmnu@vger.kernel.org, AJvYcCX7GVHlkutk7ra+DRT0rGcaAmjEOpsVL9pdTVy9Zoj2qhb9rCSNMXtXI1y8EktFpRfDVtIAd1Uhw4h6cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxZexClQPGYZvDUgRsFPpoNxI5JttewVL7Kao6pCaCPdZoaE5J
	YjpsremR1GxDNi6vG0hN7/kQ5V35t23rIogYKkJo6RmOUWNJXJup08ez
X-Gm-Gg: ASbGncubglP+NMNm1gDKbYTJgo5lWIg/Duev7pgvWk/QpH0c1lOO4ahgtxU9tgOVSXE
	CkNxlezeNFNe6ePnLELhmIcayb2SLivyTKB6Q+0GRHM8kknvHquecjhmZg9XSOas3aHIFWA1QjE
	iDDFZy+pV7M58xwA06d9zO9yCMsJH8I4tyBQQMSgp5FFetRcyKRbNPHkfYxPRalBp0ybU/JaZPj
	WcnrtXpwfgzCnuM79JUJwPA2GAU4KkU49GH5Sdfgd+3G/H2i9i1oH9K2b06Lp9TgkHvr8JJV46p
	yLPT/PXaO0xJTDjoozTk2iNnJpM0Ymsdecqhb6wf8j3H2Tu8GQTCx6dQxY2yEA==
X-Google-Smtp-Source: AGHT+IHKxSYWaV//bpv91swHLUVsoYm/dTB3IzxzX+iLpaTVjfaTfoTO6Q7QT+X+ehW3AxFWJ2qpBA==
X-Received: by 2002:a17:902:da8a:b0:234:aa9a:9e0f with SMTP id d9443c01a7336-23ac40f5ae9mr236065555ad.23.1751319985602;
        Mon, 30 Jun 2025 14:46:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b99esm93192165ad.102.2025.06.30.14.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 14:46:25 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:46:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: mtk-pmic-keys: Fix null pointer dereference when
 no compatible data
Message-ID: <667whxdsghpao5irl66oh66l5y55m4k6n3ztifaizbqtrzccju@cmghlz2yauxq>
References: <20250630-mtk-pmic-keys-fix-crash-v1-1-e47351fa9d1f@collabora.com>
 <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41f3cc74-694e-41be-b767-20c7561990b8@linux.microsoft.com>

On Mon, Jun 30, 2025 at 01:18:40PM -0700, Easwar Hariharan wrote:
> 
> Also, it may make sense to CC: stable@vger.kernel.org for backports

What for? Stable does not need a patch papering over an oops, it needs a
patch making the keypad working on the affected device.

Thanks.

-- 
Dmitry

