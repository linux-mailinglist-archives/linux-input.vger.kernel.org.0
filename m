Return-Path: <linux-input+bounces-10688-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C6FA5A36D
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 19:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218D516FF62
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 18:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DAC230987;
	Mon, 10 Mar 2025 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDAJ1GJS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56D2356D4;
	Mon, 10 Mar 2025 18:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741632825; cv=none; b=j3qZd6vbfOSxDy8+jTJVqrz5gz4TSVbITJqpq2i3rLZx5ODDNM+4R+4QvRcCc1i+Q6rvqVoh4YNPF/TdWIoieKQJq1XtHyfSoWJxAHoBIJ+xvJAiFfHc00CCYw10LlNZD23EmNoUqj0HidWeLdcni59hJwvlttjaQqnrJTFh5j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741632825; c=relaxed/simple;
	bh=UcDA6ns2OOIbj22cvfia0voAZtpRl7BvOqrCGYinyu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl06lW75619MuU4dQIn0a4yRgPNbsI7tR3hxpsBgD6+KxxIXl94Pt/6s9W4ViUrwYcfQtXl8Glt8oLfYHyeqRtI0nv9jxBltZvAP8Piop4N4lR5vT6/2kmN4hMWObcpxNyWj073KU6FSPPad6YarRwgq+r8ET+QYpscoCRo5k14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDAJ1GJS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224341bbc1dso54403815ad.3;
        Mon, 10 Mar 2025 11:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741632823; x=1742237623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bf58kJmAztwK2cJKrlusPlp/m2t2eqheCrXfAo917yk=;
        b=kDAJ1GJS8JPHjpGStkDkjoutXDpAVcY+JtOuRXMw68y6MsIUImD+OtE52Dlhod8GlR
         rK+eNtvbokAbwf7npf/pTfJaTVlCFHID1MRHb/DJgzd+p7NFRaVC/e8QgbaFkpPjFqgc
         yqJUjIHkeKkzpambeMalx2LTRzVUkew7BeHKTPpeTR75kCKPtkqcBuX/ox0UmfEftW/6
         EZzQk11N5c7YCY8YakM6MyVZgm9jkU33Li9VQDkQt/y6k99eOJ6zb2y71CooGUw75IUh
         5SuWhHQB69iUqez22UA8YrCdVKvMtT/6XjguXMNCBf2Ww+HJok4/U045JkubGH5zrvUf
         vIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741632823; x=1742237623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf58kJmAztwK2cJKrlusPlp/m2t2eqheCrXfAo917yk=;
        b=tF9Uq8pbGIS6YTuL8DHrQXE6XD3Irui+raQC48QUNVxgHdmiuoS08K1Rg7UQXqHMBb
         DoHio1StlcbVQZ/nwkoTOUs9cQt8Gg0TSrdB2r8BCQHb2tQ4uFGOfcZI+r5gJGCTytHU
         3lWqJF1O8OLFlmTNt74VLg6n8/4UFDg4tOtublDDUFiRtLoVqhyZ2zFkclBXph2WIb3L
         xklW55EsDa8y/WcKlEAPanCYrTX3QXEwqwotVBB6Osq/1pJmKUb8Zmyb80kG6Ez7q3p4
         F+EyKf9URwKKa7OzWW0VriZ4cW+ZacoBVw0w5+OxZfFHok+zkVVNYbgoboCx/JiIqpzV
         Hxyg==
X-Forwarded-Encrypted: i=1; AJvYcCUHLqr1MvXwHV5p45Z03CPEJ12z1o7HXDc478hcyw9XRQfpP1LjVhL21OoHn6q2FflBATf29BkyJizP@vger.kernel.org, AJvYcCVb4i+yWuWpF64WUgjjo61YNUCWx0RZFGjYYnXzjozwMEXlGLB0tS8rsKbqFSAIqxRNVWD1f6z9Jq+rz5U=@vger.kernel.org, AJvYcCWa/N0foVPY3/D87Q6UaNrtYZAwatT1pwW+9BCUm+nZEg/zpHEqV8oHjO8gQaKh4Nd5QAtyZk5LYgZ1uN0m@vger.kernel.org, AJvYcCWeqUyBPUaxziyAW9YoMNa7+O6vgeJ9Osta/P2Yh0x9e+puTLz9MA1pzBjO1vyNMJqWmmRLlwuJFd2//i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxWpWATYpStLK0n+1QFfRrmtx5/hBVdRIhq8Lt9bQGh+IpeenO
	BERkm5voR2sDoN+v62hqTTxIe6z8awmClnssazs2zVojLf9DTuox
X-Gm-Gg: ASbGncvswg0Rn2XIMmacfvHoIZmbMaTSeEEaCFrqUHXD2zG8DW8zWbwkia/DsPlf7uP
	KDm0aT4Fm3qp/Fl1ZkCSEd08I8DoK0/tHJf+hK32WChHtO/HN2RPBI817XrzI+DZ58tQthjV5I7
	HMVPRrNUL41Pp6hUOdLsU4AVVmcdxmTAvLIjtIK2lny4/5tIyC8kqe8SbNB5Ibdout9WBENmVlU
	BSkdIC7xc+ohlIwox0yXfa+GvcDFBBLnl8IGdZiR3KuWx/NVVwNsvdyvaS7xWNtJd78iQHyJmGX
	e9TRYa/J/ztdYTK/nu1DipnR5XzztQ98IRCrsTUA9lF9
X-Google-Smtp-Source: AGHT+IG8bsKLqFkwaIahuQSaDYQrFEsJ5iiPIYNO/LVxmoqH7Da/WkO3iAcA2T70KKZ39rq0aWAg0A==
X-Received: by 2002:a17:903:2f86:b0:220:c63b:d93c with SMTP id d9443c01a7336-225931ad50bmr11928595ad.44.1741632822874;
        Mon, 10 Mar 2025 11:53:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eb9f:29c2:9ede:46d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736cc153016sm3716292b3a.173.2025.03.10.11.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 11:53:42 -0700 (PDT)
Date: Mon, 10 Mar 2025 11:53:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jens Reidel <adrian@mainlining.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 0/2] Add Goodix Berlin-A series support
Message-ID: <Z881MwZjmu0sUXMI@google.com>
References: <20250309062315.35720-1-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309062315.35720-1-adrian@mainlining.org>

On Sun, Mar 09, 2025 at 07:23:13AM +0100, Jens Reidel wrote:
> This series adds support for the Goodix Berlin-A series touch ICs
> (gt9897). This was tested on a Xiaomi 11 Lite 5G NE (xiaomi-lisa),
> which uses the gt9897 IC connected over SPI. I am not aware of any
> device that has gt9897 connected over I2C and therefore could not
> test it, so I didn't add a compatible in the I2C driver.

Applied the lot, thank you.

-- 
Dmitry

