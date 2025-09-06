Return-Path: <linux-input+bounces-14528-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 192CFB47403
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 18:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 039E11896597
	for <lists+linux-input@lfdr.de>; Sat,  6 Sep 2025 16:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C92D25228D;
	Sat,  6 Sep 2025 16:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPypL8pJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365124729D;
	Sat,  6 Sep 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757175615; cv=none; b=lfIAXBn6IAXKu5riI4/lup/RqS6P6o+N2sOQfZ5r7JguB3JRvzDKwgPdPN8T7nzRju0BFMPBZmJMi3zUhBU6hRQFjFK12kDXhJe66hVQ/gSoBXUsiKBqOJ98OC1M1CxkWcooAPZAnYsCefVDaZGFOJ1yzfDXCIB56JtshtYQTJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757175615; c=relaxed/simple;
	bh=Bn/jHYQx200PUbSrc1Z66yZsA5qTF4RnElG8e9gDuFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZSNb/ciTG60AgPsdgOUAicrtksvyW1pZFT+KMsStaWI9hKAfEKt2cmrrBPg7nkHqFmkdD67IJ/uJcxxAPf2xt15iNxgY2WsJ2WOn6QfFxL+n19Jk5TXNipnma7vMTqwaGHmJrsC3dSJbQCUiRxYPbOy862/oWHpUxR9xvLrd50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPypL8pJ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7728815e639so1761075b3a.1;
        Sat, 06 Sep 2025 09:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757175613; x=1757780413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qlAicO4VJuwjpI/abeEihOqBcsHKjK5GHV5eGSORL6E=;
        b=dPypL8pJHsPQtop7/pjqBYD32TCLmPfQ/c6zwAc71D/QF6azLXV6IqMLa1cJ7nV4hy
         Yeeqcdh4SMJ0UCDdJO4th+WfbIf1RHRMFfDw3HLlXKF85zFUa+9MAdDQZ7hgJ9LzgYca
         XB3E7F4VFBaFYmf0LjLEcEmP5cZhkF3ln2bgnCXCTeMlNznCYavg3cOOQt2L8RPSpuNR
         jKKz6GUDOKG4P1PWPAzHxjC5mv2Kbi8Nh8zAHVKV8SaF6Xi3vhhu/g8RYALNQoa23hHS
         TFwA8Kxq4CYUyGPOV4kV589f9Srfz1qmkvh/DWq4YEFxSHQAOSJbA0TMxq6DCRKgyNDB
         1hww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757175613; x=1757780413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlAicO4VJuwjpI/abeEihOqBcsHKjK5GHV5eGSORL6E=;
        b=KOpcenwyQg8+ycDX5EIVLXSEXyD8Z6J0YpVFZK0SfM7xbeu4MJMy3Cz/CoClfVgzHh
         UUq3/wQNtZntCzfN0ebV2P5SJOo0l6oQz3p2aJ8PQxkdYy6W87el+bnP3gvV7wJ9amJi
         +KtTkC91wLj02ueIW2DQqV+bqn87Q1sOLicVL+UurPQrk9igeBS80QtsIyWj6B3hL9Zt
         g7plP6e6qlZXojrtynHt00zxM79cVWiBLNBfFob0Ou7wWNzc1bZ6MIVdTJn43lOPFfzL
         Qd1lnKONAWz1NdehewXdIOh1UQS4rnPie+fJsioHxNaI6EX+EsqIa5yX4CxwbY85O9IM
         VoIg==
X-Forwarded-Encrypted: i=1; AJvYcCW/8elXuBkgfcEioKiCGlHw3YxCsowIqtE6coHSc6t4u214NQmHHlwUGStdmewbL64K3j9q3nQO/kgFJ88=@vger.kernel.org, AJvYcCWUJ3gu/P7RLozsTeBoqslgIICBQfO2d3pq23zKM4P/JB7dwaFv1clzKyiXjHj14h3IYl3ME0NNHPXu@vger.kernel.org, AJvYcCXHqsIOpBqEPR59/9qv0ZpqHDjHRjYb1Uf7GXzl+wox87iRmjPuU4ZQCxMf8/2niMxAxIn8LpfYl+o1BwF9@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ7TriCYigPFhaCREa7/a/6fmxtFkwhalvaGDvEs2c3kWLzWAZ
	RsUpLVo0glNkUKlguzXsc9LVYjROsEOubnleGzQf2C2ZLz3l/Rrfv836
X-Gm-Gg: ASbGnctPVlRegDAatVgGlgqjRCxVx0pSfzjdi43Edkc3v9Fq/w9tyTS70L09XSJm8PA
	rXEVJ9VmGJCTa83nhuDvldqsPFuej8oOZPrKEBqfuLxydgOI+4c6GGzC5sZL2y8hl+Z6Q7Puu09
	mNUnCnCc+CPAfEi9h//rXnW3Y7zuyrEizHEL5/FoTLGi+Y8uvICKJ+IQj0XYIZz8hVlOeY5+egn
	pdAycdsRoknlMknRD9ZuPm6UOSSRFkFHnJxoPfo5zEHWPTLM+0ZqPBC+ZpysXBoH/RczHKL2NH7
	85MQtAJPHIKngI6gMlGyuRaXNYG7MLZmyPUHIr5hvC6UOxkBaUOztiEvusLdlxDt92rmlUe1d4r
	z/OvO2UyCVKDn8sdpYfDXmnE=
X-Google-Smtp-Source: AGHT+IEswQp2znCUxy3aqeMwXMObMkOU3eyuAOWo7d7qI92Dc7qQl74XXiqhutZY570cVte/uEI5FA==
X-Received: by 2002:a05:6a20:6a20:b0:243:a4de:d7f with SMTP id adf61e73a8af0-2533d6059a9mr3442665637.11.1757175612868;
        Sat, 06 Sep 2025 09:20:12 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e08d:5959:e7ec:1beb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006dd49sm22515784a12.5.2025.09.06.09.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Sep 2025 09:20:12 -0700 (PDT)
Date: Sat, 6 Sep 2025 09:20:09 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: exc3000: move eeti,egalax_ts
 from egalax-ts.txt to eeti,exc3000.yaml
Message-ID: <ux4t56t2ec2gejy7hr2dpht6f7acda3gkm3edfshk75idgpzmd@g7d3bvrtxppk>
References: <20250904171543.517650-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904171543.517650-1-Frank.Li@nxp.com>

On Thu, Sep 04, 2025 at 01:15:41PM -0400, Frank Li wrote:
> Remove legacy binding egalax-ts.txt file. And add compatible string
> eeti,egalax_ts and wakeup-gpios to eeti,exc3000.yaml. "eeti,egalax_ts" is
> general compatible string, which is not preferred. But it is compatible
> with old devices (older than 10 years) and existing driver in
> drivers/input/touchscreen/egalax_ts.c.
> 
> Allow address 0x4 for eeti,egalax_ts.
> 
> Don't require touchscreen-size-x(y) for eeti,egalax_ts.
> 
> Keep the same restriction for existing compatible string.
> 
> Fix below DTB_CHECKS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

