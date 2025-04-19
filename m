Return-Path: <linux-input+bounces-11838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A31C8A940EB
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 03:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB2DB8E0EB1
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 01:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC60A3B2A0;
	Sat, 19 Apr 2025 01:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Et9WFvbH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AEFCA4B;
	Sat, 19 Apr 2025 01:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745026852; cv=none; b=gKUDC7I/RZ+L7sjJMNFKvhm6lOvLah7phSEd2qtn7oXamn8WtFd1VYX5NO1HSZ8c919qIZB4djRGTYfCWJvpXNV5hcoWbxvKLhFsJhYM2grnM/QpmYl0VrMDYljcAJPH/vF+iPLe0ul1L0x4F1MTiFyKWjKJf6K7JCZvlWjBw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745026852; c=relaxed/simple;
	bh=pjmjbnuHCGXcTmwjQDGvwIwGoXjYnd5M/pEz2042/3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bytFJdXCpa4Y8Tex421qsXVly/QoMvvNqnTy+1tlrTtbsUMR9FZZcT2zjYqicUlDR2nMAojQU+dk1Ymi8Td5jV0Oc4/o8hcw58n7mhf0OxFuMlGFrBipri7xtrdm0fAz5wPg2OfU+/8xy3g2fSPfm7ZYu9Pb6xU+Sr2jZWA3VTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Et9WFvbH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2254e0b4b79so34971565ad.2;
        Fri, 18 Apr 2025 18:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745026850; x=1745631650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcP2crrAxzsTAHpans5Y/31i3MwD9oax0PB59MLhmDc=;
        b=Et9WFvbHEGX/r5ynXXd1WW3lNT/yezDJLVqKt0L/5A9buv41o+oFtpXQTKkSglIEzT
         JL6Oij03Eg0OpwKcDtYXr/xQ6JJwdPaNZr0tygid14p/YCF/JPaWs5M+DQaPHd3noBSw
         hapL+fn99T59gHhAqBwQjVZgByVt5GakE6OqWDpJjNrXyZAVKm4zOZZIULUE0FRuolpZ
         CtvpIKA7XXL3XoO55GNvpQbF8oihzde2G1wEgPt3TJ+T7kQfEw7FsxlOcQqo/kGm+6C8
         0mUHBn45CRygvwddw8GRU5XSS102b7EbXH2DWPl9wLezP1fNEWhnn7s9oRAbqK07/WJf
         uhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745026850; x=1745631650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcP2crrAxzsTAHpans5Y/31i3MwD9oax0PB59MLhmDc=;
        b=WR09CDjBFJanakmPWoqob8uOw+xg7tfjnXl6qpk2uBFSlIxcJf2bI+PWeemiRQtRV5
         wMJSCqgqtk/EDqRtUS99uS1IHCPMSrV+gXXDQZecW4rIBo0TG/WE3XQT4FqJWWDD3AyV
         xUh/TY1KrvHEFsf5sUC6XeGtF0JU+EwfAsGrV9T8QrR4BjZM2Q+wQcXjbUIT5XUSNJvQ
         Dp5FiMB4ynYFS7sAzVAHAIlYpn3OACo4V03EMou6U2eWmM4nsniFQkYGe2tGDGpiB4le
         SwvlU/yaupkx0V+FUG/l/MEYS1g2ud81tcvHTCHj5eAoxCDLybCPnYRotEbb5/5PTjVa
         wUGA==
X-Forwarded-Encrypted: i=1; AJvYcCUPtg4ouQG2f9xNbPk4EIoIok0NHbnBIFX8HLitgEO2MHPx1CZK45y59wcAcEmgQivC4ThTAv0mxpL0bw==@vger.kernel.org, AJvYcCX8uF5MGwb2zz+g42R7jphcLoZpbhJvJtDHotY1iWOmow8azI0kjkb04cSimyOiWxxu3D9QlPrlGUXBLHF4@vger.kernel.org
X-Gm-Message-State: AOJu0YxN806G9brUlIScSRo70jUFBsTijemNm1WDbQeNZB7V8eveU0SE
	Lh1CfR9fQoP8BzkgqBjXN4zLz4JBQv4GNwcBnxOtj0kP3WlQYR+F
X-Gm-Gg: ASbGncvmkCc3KPix7uxI7zi4L1YMcM9J4z/rgzlL/TSWnmv9PcLR9Tk7oELSmw+K8ml
	8zG5pTkZlnbUWf1AmG6qTnY6NKmTawtZllXBxQWDgxETLENVuBlsH7uLMLbKChz6yaQ5R7obkdO
	yM43KQXU3ZpEouB2zZeGMCcTg1rvY5/aNMkiNfOrLWkRaooUIaRW1/Thq93fOR3V/B3bAxC3yH+
	sbsoWRxpY56EDH1JoUQBTQpGciFS5y2wiDMf1AX4Fg++kYqxSSiQwkRtAK+qLSX6wGz6UFrTBCk
	Jwt5kJY0/EPGIoQ2+neTbNSg7Euiac3krJOMYk3M/ytgmF56Nr3c
X-Google-Smtp-Source: AGHT+IEg9vtNGvw5hfb05C+bnyid1iZ28Ruoq6Njs1i+cMgE2hFbQWHSaFMZxcy/UtoQKD+eoazinw==
X-Received: by 2002:a17:902:d4cd:b0:223:2aab:4626 with SMTP id d9443c01a7336-22c53567019mr64151345ad.11.1745026850171;
        Fri, 18 Apr 2025 18:40:50 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eaea:89f0:c84d:941a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4bc9sm23411195ad.128.2025.04.18.18.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 18:40:49 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:40:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: javier.carrasco.cruz@gmail.com, wens@csie.org, 
	u.kleine-koenig@baylibre.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	davem@nuts.ninka.net, zhanjun@uniontech.com, niecheng1@uniontech.com, 
	guanwentao@uniontech.com
Subject: Re: [PATCH] Input: sparcspkr - Avoid unannotated fall-through
Message-ID: <6ac4jviwn7k7thbdgstnmz6ntjm7gjyafb322n32ukqnkl6uzp@mod6fkc5sicz>
References: <6730E40353C76908+20250415052439.155051-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6730E40353C76908+20250415052439.155051-1-wangyuli@uniontech.com>

On Tue, Apr 15, 2025 at 01:24:39PM +0800, WangYuli wrote:
> 1. Fix follow warnings with clang-21:
>   drivers/input/misc/sparcspkr.c:78:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>      78 |                 case SND_TONE: break;
>         |                 ^
>   drivers/input/misc/sparcspkr.c:78:3: note: insert 'break;' to avoid fall-through
>      78 |                 case SND_TONE: break;
>         |                 ^
>         |                 break;
>   drivers/input/misc/sparcspkr.c:113:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>     113 |                 case SND_TONE: break;
>         |                 ^
>   drivers/input/misc/sparcspkr.c:113:3: note: insert 'break;' to avoid fall-through
>     113 |                 case SND_TONE: break;
>         |                 ^
>         |                 break;
>   2 warnings generated.
> 2. Reformat this code block to enhance readability.
> 
> Fixes: 215ea853a9 ("[INPUT]: Add EBUS/ISA speaker input driver for Sparc.")  #In history tree

Thank you for the patch. There is actually no bug, so I dropped the
"Fixes" tag, but otherwise everything looks good and I applied it.

Thanks.

-- 
Dmitry

