Return-Path: <linux-input+bounces-13697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBADB12EBC
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 10:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4650E189990E
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 08:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292021F09BF;
	Sun, 27 Jul 2025 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ig2pAft1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC609645;
	Sun, 27 Jul 2025 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753605832; cv=none; b=lak3YfnSrnBrWnf/kP8cXX+75V9yYkC5v0J0V+MBIMFT6ROzCu598lQ/j3VGPeGnhKlp/fLi7W1C50vnZlvYl6kHIx58lS1okP/A79AJPKd6CyjeAfKnogZj3gJdkAgmvgXsKC0zOnpoHyA0sWFpjHHjKnY9Z1axiq2i4UianXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753605832; c=relaxed/simple;
	bh=wdPpue6cQRZ45iqTOCMVPSODzBOKWj3BK49Ut3S/T4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PZ9J4Dh6+5I+7lK9rMjYG/O4plzgg6iZMrJfs116gRLD3UO0Q8KFclCn2+YQBK+ECVxl2NFNst6BHe6w/HvHtEyrsqo5yuwx86cUYO7rg05YIvR6U8pYFfPdKL7AMhPEE/RZWeUSPLHMLECMjJjEDlse++GpZm/H/rsjKbaXmYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ig2pAft1; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2350fc2591dso39979725ad.1;
        Sun, 27 Jul 2025 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753605830; x=1754210630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z8NFLmsGhXOrBNXuU/ihDT+2dF3Ew5tMWev9rrSJi5Q=;
        b=Ig2pAft1oqvbrlnv1xNIYXkJ0LLHUOJnGzKZ0eAB5F23chgbxZ2bF7qwZb0OTn+uTM
         ocOfDfvZP3LpghJpJl1zBB4H480bjbp85M0LGFsXsZYsZAkbPqGFv4XKSLS8ZFYLtr0K
         VPjjQvstfNP0cgAMBBfjhF7CTQRrMxWtgbX5LHqIHlhV/TGJ9kVv1jVHfJHsq41g9CZg
         ajtuDgrdK42FP7efUNFQeY2Ir2+5zsyLRn+4OxwX3LaSX9dqolZpX1fBJIn+SvNX9YNP
         lKOHlDDLyK60UN3aoFXfYcwRtLkh90V8ZVm+rwCtAv7kaE+E9O+CRZOKOdbBJ/pNbF3b
         T0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753605830; x=1754210630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8NFLmsGhXOrBNXuU/ihDT+2dF3Ew5tMWev9rrSJi5Q=;
        b=hEc6OyUV5Fl0gGrCpkA+KXNNr8VRJgESv6q9FdRAoOrTnRJMn2vYjXmJfCUnQhRhPB
         Mir1fw2TTyq6UDwgRVxHKIgPd3DqYukadUVh5za08yhl5pSyz1XCf/bcqSgygN3IiMPr
         KB++AVcgqEkUdxruGaP/iKOgxxsnfPQGzwABTv/NwA+AtvqrEzq/HkRdao8+ToYwkXBA
         FYqM9nq+FO8DXb19fAufqhz948Y21f+xgOO+zfMhiR0ZASpfV4uvvVoDq3x1SLnzTtMU
         7eoX3K+MV8EbjHRm7A4J1rsNqIwU/shwDjmwtEmAMPnyfLQIJzzsFpOErBDXg92ijtp6
         XOuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSAGAsdwBBgfYcvD/e3oHyqmtTCgZJecZ+B/w6+g7rrSLWFVMp64f2SQJIN7VTfjlwNZa4Awn/nxk6g/DY@vger.kernel.org, AJvYcCVazs9vlaZgo0QsQ8mszuzePVm5AtHEIAzvGVJOXYAblL3jB96OAu8ztVjR1NqqwpxctZP/3bX2WwZ1Tn0=@vger.kernel.org, AJvYcCVmmcz/Bs1X9sMbhUaUURdsUYIQaOySHUjDDDfSvJlQ4dbhpoIuKufImWR2clCNKC6PGJrbteoz6ry4@vger.kernel.org
X-Gm-Message-State: AOJu0YxuiqDIiSg1rA+vfqIZRZoTwJxyAk+kG//5zJDGBndGaoqOF/qE
	pcJQv5N0fFnLXwygLu9JvlzM7GWg4U8N4RZGOXLMS0orTT1uM/g3745j
X-Gm-Gg: ASbGnctQ0ugqsZ1ZZlRN0FwXZmYFd8YTP/9qBrDekGLcMAHU+hd+R+qPxkp2jg9icNQ
	5xNBLgZ1v4Bt1vlR9Fg9jgd2En9+QP91Gvme5pBNtVDffb4E0owOv1ID4n2SNaGBzf7f6RztrNZ
	6e7sACxw1PfYbQ9XAxc2YoxUj+76Hk6MivvncMlUgO8E6VnXVXY9+U6ETeT3GJ+6G5xbwHMe8HD
	b5wXY0ih4Q2gTjGHCq1BNWA/mqFCf7YD8EXqRqTKVOHvVvT4FDrc49p61OyownykufU4KQunlVd
	/yqRQOjtJajEf1qG54wro71dQIUQRhsAHtKsGfRKTjJ8NU/IJA79nJaVPmD0sr9lT2U9z+QckNJ
	+97at5pJDGNLHjjJX6Gd8PiWuEn8tA/di5A==
X-Google-Smtp-Source: AGHT+IGTtip7TqXZw8U+iPg7zXdMeJY175R40wih2BC9mgWqMCUsqc6nDFsjmTq2gzQSxD2gnAjCSQ==
X-Received: by 2002:a17:903:2b0f:b0:235:e94b:62dd with SMTP id d9443c01a7336-23fa5d7420emr187334415ad.12.1753605829876;
        Sun, 27 Jul 2025 01:43:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:152b:d3db:2a19:4eb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe5781aasm30319875ad.205.2025.07.27.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 01:43:49 -0700 (PDT)
Date: Sun, 27 Jul 2025 01:43:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bastian Hecht <hechtb@gmail.com>, Michael Riesch <michael.riesch@wolfvision.net>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v11 0/4] Input: support overlay objects on touchscreens
Message-ID: <wj4vnqkjne24twr2lpzcyi67dhdcu5ogmts4r3uads7flpmgud@ltgnxzqjxnth>
References: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
 <e2ed48bf-386b-4c14-bc9e-0519da415c73@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2ed48bf-386b-4c14-bc9e-0519da415c73@wolfvision.net>

Hi Javier,

On Thu, Jan 16, 2025 at 11:41:14AM +0100, Javier Carrasco wrote:
> 
> Hi,
> 
> as a couple of months have passed since the last submission, I would
> like to send a short reminder that this series is still relevant. It is
> of course not urgent, an Ack to confirm that is on the queue would be fine.
> 
> Some commercial products are using this feature since its last
> submission without finding new issues, and it would be ready for a new
> review in its current form. I just verified that it applies cleanly to
> v6.13-rc7, but if for some reason a resend is desired, I will do it
> promptly.

Sorry for sitting on this for so long. The series has been applied.

Thank you.

-- 
Dmitry

