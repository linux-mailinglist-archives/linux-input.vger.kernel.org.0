Return-Path: <linux-input+bounces-12936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F44FADDD3C
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 22:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E93BD7AB003
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 20:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06F41EBA14;
	Tue, 17 Jun 2025 20:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q4KBDUrO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756AA2EFD8C;
	Tue, 17 Jun 2025 20:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750192251; cv=none; b=RnV/CXnqmZoV+NVMrxMn3U4OR5dcXrCpxt3lWrGu03ox+lqIRtMeRKzOm/nAH6q+aevHwe/gLnkDLD7Y5JX0nyBnFXlmwhY72ih2K1kqUVL3cyAnVPccYYGmjmPiS9pXM2aGN6unuyTW0x5kgxRs7HuYCF2hWgd1qqYeesRWsL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750192251; c=relaxed/simple;
	bh=XuvEZ225XWL+w6sEVTdpw8gxml1hypJ9vxYUkSWza54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hl0oVBhv5M6Woq/S9A1wIZOGPgJhwQAMWc+LCT1Yz3ZWcWYV3hD87syRauEV5pl8rGQC5IaPf8hNqcYk0kHRV6RDwou7x2r3AkFjFm1XqxvcE/7K6f8vEhg6iLiwXSKjcHUxlmSdyuQ7usQ/TeGtVVp6/HHW9aTTOVg29K7MVUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q4KBDUrO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2349f096605so82613315ad.3;
        Tue, 17 Jun 2025 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750192250; x=1750797050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytge0DvQREpsX3FPr8UiIpU+73HOBfPpUENAsXp5RGw=;
        b=Q4KBDUrO+eqGRpBY5hwdniy7dL7IPJKr2T5AQRlVSMqYiZ7v6PX2CwP70A/wuNxJyB
         sHRTomVy12uBNffwLx/cZXndZZwl17t6HARO2ODAknDGfTctpeRjbwWBlLIIOzPT4J8A
         kKlxr4S2TsP4PERrWf4RpiMqkiMruGtYeXgAsoe8ql4TUj7KL5nqsv5FyMlI9iimNIG/
         z75Mpp1nHjYimDHreVFqY9iLArTvj5Qu1IHXjmAzt75FPpSS+q2pKo+JfUGCPR66Y02g
         FFQgoP/hkCV+XOwIGcFV7oOL/qDPVOjg+V+Hfz6dMHxswObCWSpA/UsqccXq1MOYH9WF
         Ca9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750192250; x=1750797050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytge0DvQREpsX3FPr8UiIpU+73HOBfPpUENAsXp5RGw=;
        b=u7bX7Qb79h2cy4JIridoDPDfWfze+Ca3pJwaHYwvu3J4pWlfvA/ismufMFoLgTlzCC
         tY1Oxeg342jkXOqpBln8vfEp4yQq84W2GSrybMR88Dt+XlCVR07sYmecM5QT7tErEjqv
         ea3Py4W2PDd6lG+lrS//SRwu79k+XjDw22qgsjFHcZVd0ogxdLn3smHq+OV6ZEr4qYlS
         VIWzuZZwHXr2AkotHelBgnqbJ5mBqpZNDu+i6VPvT6Fas2q9aPNUvyP+CYDhATlo9/Xz
         6U2Apf2IBnzDTgG6Xmhi4kHK30B8aQqbbBSgKdRMNrLzYvbRQy/xI5FDMXFBMB0IsAn8
         zjhg==
X-Forwarded-Encrypted: i=1; AJvYcCVCy3uj1HbnK4iO4Sdi47jV+0PwZVTmFYbvQH7YO5Deh4UehEyFVXnkbrXTSIKHVmu6SR2+Ozme6Mohrqc=@vger.kernel.org, AJvYcCWkY/sTe3Dou9mvM90LgGCVbcGuE8fho3LFqkDg9U4vBtLSq1Vdnj54YUIB0EM5RY1dUBBdqT5BbwJz@vger.kernel.org, AJvYcCX/eVySz0skjkui8M+lxY8Py7IwmpzEGSufHcsZ8FG7gZfTuEHC5mNhathwglBNEhgZzayh5iQOrM2SjFG8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97YBz66QhqOrnHbuzGATSeCeiwX9YoALkpsksm6PlLX5EWcHr
	QOlVFp0a9/y0r3udJ6Z010Jk7LnU1PzFmT/63iD14WEhCypkTF2hc7gH
X-Gm-Gg: ASbGncu05f9nNxcI/F9VHZbaLJ0XsAJMCQ2WSbOTbcPfEd/tG5uYzeRtwM/sJKEpkSO
	7mzCuUzHsZlLqfDYGeEFqJkwLaKyIqDFsrnWasL+4IRH4PnB3OngPkvqKFsStMpMYgkic4/o3U4
	TUg7AWmEsBBl5yWVdSOSa8yG0K5S0kroJOB5M6H7UNSI9zywz8mjiIPGoyOx2y6fuLrXZUblT9H
	b1oak0cvyiC2PnBGvdeIMubLyYKXomO1ZAyWnjwCls399h3LBkMoczvmSN4g5sfnRCx10cdBIbr
	iByXqmzaRq7scjtmGmWxdiNwvDPX1tj7edE0JNrzzWHcZPq8Rldqugfq9dKr6N0=
X-Google-Smtp-Source: AGHT+IEl1LF76euKDmEK2b2BXIXslDp9/iHoV2XPh1E20bcvG0JJxY9n8fjrWmH0V9E0TDySKBwOcA==
X-Received: by 2002:a17:903:b88:b0:234:9094:3fb1 with SMTP id d9443c01a7336-2366b3c2d82mr257503495ad.35.1750192249605;
        Tue, 17 Jun 2025 13:30:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:8d7d:9cdc:2836:83cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1642e0asm9364972a12.17.2025.06.17.13.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 13:30:49 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:30:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
Message-ID: <zcdks6nwmnahlgp6vvbxmmlbfbafzluuxgb52byiisuoy7ewzu@kao7yhx2u3qt>
References: <20250617082004.1653492-1-wenst@chromium.org>
 <20250617082004.1653492-2-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617082004.1653492-2-wenst@chromium.org>

On Tue, Jun 17, 2025 at 04:19:58PM +0800, Chen-Yu Tsai wrote:
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
> 
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
> 
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied, thank you.

-- 
Dmitry

