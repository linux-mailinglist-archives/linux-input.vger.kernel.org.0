Return-Path: <linux-input+bounces-14529-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE925B47406
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 18:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B01193BB747
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 16:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2604D24A04A;
	Sat,  6 Sep 2025 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdHD5FL7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FBA1C5F23;
	Sat,  6 Sep 2025 16:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175634; cv=none; b=mZDQCceWNwhjOSa9DHh3SyaKLPeTr4NzLnObqF8jSFb4nlO00QL7waDd1LGhqaR5I/ooY2YZoruKya2Ojh+06+zDwydPMQKsYnfn9oMh03vV9meSydMRapVqovQqoiOLQxdCwm84ybEztDiaoIo9uvDk6ll0CDi2eYPzsuBEOZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175634; c=relaxed/simple;
	bh=/CQHIaQXdkJAOJAs7O7aBXuqj1loFRx01wXpC3XY/W0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2jD/Vb7EaYe8810dWjNK5+eoHEG+58PbZf1sE8YrE/Ob+3I7PvYAapwKGFmFhp4kLRfl9JiZtXyF+JpqGxN38VeeFJAJQr/CRtsX+A78cb3RgOJGG8f1qJBwmCvG43wQBqN1+/2NUkItLPM4GYB3rzsjWaoMHNX510mFqyLwlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdHD5FL7; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5229007f31so140381a12.2;
        Sat, 06 Sep 2025 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175632; x=1757780432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bbfrXN9NL/sgXjwGy2qqax60OBMT4y9ypEag/YlvMHc=;
        b=cdHD5FL7vjexHYIN3gfYauqDTitkit3SudZ1vru3xQbRvvPomg4ZAjYpL0x8ZXrmjH
         D0pXaWu9BPQr/vgRsJlCCSkPiJAYmo3LeY0ShlKr7h9gP27ohBrdYJbIKsqhKkFGJvo8
         d3lWDrlnG2rlBG9lTLms4gfwCr1Ud3VHHLFyoA8kPMph0W4cSsXH7iYw1AJuKtsF1yjE
         vhB1z+WOqcZ7nDFU1B/63oPoHvrg+wy0dOEUOJxDb3QG+9vPy2kHG8oAyTXfPG8qsrBq
         NOfjhXumVRzvler5ya80IezRAooij5QxyMhmJiPIeDrDxQY39X84SS7uAaHMv5Gs6i9O
         XOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175632; x=1757780432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbfrXN9NL/sgXjwGy2qqax60OBMT4y9ypEag/YlvMHc=;
        b=juuL/doVRQjVGvhPaE5Tgk2Cau6MjVwWGcQnqqLlDJ/Dmow84ikvtX9C7xcPcteuH4
         4ws6LmQe2/pL6MaAi2THCfwr4/lc0aE/EIr8jyV54DZItvn1YtTWuf+ZhPj8z9NEyWqp
         aGFakJfdEPo/BTJEsEv2T3rDAuVuKIdVpGCIEUCR3eTx5uyUf5rxJjQE7DphU6uhGiCY
         1qryZ9meo4Y+S+zb+tP9qJlvCENqR6+EmW5K6iaQX44q2wzouxtZPljIjdZM+E+Fc77o
         hxSXdxbQEo+T/4dZ2TAqEp+0P63OovRPoHD89HD4hNQvhZRlLwnhJBv2h9xbnNJ+em5d
         LfAg==
X-Forwarded-Encrypted: i=1; AJvYcCUL+tMR/ipWeFlVWxymabs6/tJ9fHIxTYabOnpDss50jn+dVwLC/QEgqwo/Kkn5ETttnJLCkOpxslzE@vger.kernel.org, AJvYcCVU1BX/6f+iA34OugfSVmmR5TAx8iAQqX0hsPv7I2Rk47D7BHZHJDJaHAntlif4m6XbaNEtIPnE5V0YSIYf@vger.kernel.org, AJvYcCXZz9dp3zukB+Hlm4HI9oVhoivM3W7EA6/caH1aaa6d40ywjGdAngmy8Gouh8P0RwsgaCebsMosJvQowKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykDPsqLDMiqmkGtHcpHXbOM+jmC4Cd1Ckw2P4QAr8Ea/A4NQfY
	iAi3Ss5ZHbR6s+FG1/KI16hfks/PbShYUv8eTeteBXgAV2wH0IeXGR8CQkwjgFML
X-Gm-Gg: ASbGncvLK1VF0Lzp164x5D9wshzskFnS8JTlHHTM0NslAaTchku6Sbf/Nx15+Tp+mPV
	s44oLGCsx1hG8vcX41i8Y2+WrJy+TqB0I4tr5T0njy4JD72270WroqvmzAoY95TosOTzHD/sdfK
	IA48a8odm+WVZgriZ0q5vY67rU9UJcWWsqMkzIySEKvFByQSSjw5XBk7/fFIurVHoQSWnwpNpCI
	s+XvE5trQrIwoMfiWELY0AQUkACA5Kzv98a/cRuHxknQbNsrhzRgXdhAB1C7Of3v5HdKhS6MfNL
	/Z7FFEhnktcmnfVIfkYMNDwzQQKs3JuNCLsIKI23oIz12QdrQSGjExduuty2mcj5xvYY0HpCCHh
	kIk0Rs8EZ70uMJdNe8nydK60=
X-Google-Smtp-Source: AGHT+IEKtOgODhkegHRkg01Lx27B71TmWjNKUp2O/vwNN2/Yn1bD5b3dqGY98fdLQw5yzaCgB6oJIg==
X-Received: by 2002:a17:902:ec8f:b0:24c:ccc2:af36 with SMTP id d9443c01a7336-251715f34efmr31134895ad.35.1757175631873;
        Sat, 06 Sep 2025 09:20:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cea3c7a83sm53420805ad.9.2025.09.06.09.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:20:31 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:20:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: convert semtech,sx8654 to yaml
 format
Message-ID: <i7janoljad6vr5ewhtetnnpmmsyh23uxrqgupelvikcjzea67z@uninqbt3zk7c>
References: <20250904191731.528145-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904191731.528145-1-Frank.Li@nxp.com>

On Thu, Sep 04, 2025 at 03:17:28PM -0400, Frank Li wrote:
> Convert sx8654.txt to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

