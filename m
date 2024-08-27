Return-Path: <linux-input+bounces-5905-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7477961257
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 17:30:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 717E31F23458
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 15:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF1C1CE703;
	Tue, 27 Aug 2024 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kt3rPFzO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E2B1C8FCF;
	Tue, 27 Aug 2024 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772472; cv=none; b=e+Tti4K56R5w95bb4wv06jZkuXX7mvjwAs2+XlAURsPhy6WNUgU4x7cJ0ZsPV83YTTvyoSOLCKFlNCJ7AjY0oaEscniwt3ZAGulzQ5L+uKr3icoiRALVbdFkw9euBn/w/nQl5stnnh+8tbEvoBEs03/9+DLRKvBVRxz2UCYIt3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772472; c=relaxed/simple;
	bh=d1d5cGqzy6lm6m3aGhaqea2h3PIg7NV/csf/31lm2jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khcp8Z95VBh/JeoqBsBiXyt6f6BZCI/8I2vZXx7frKagluP2Cpzj1jXF5uxngEA+v9v1VeubNA5kWjXNRHaz6T8Yzkx2A7Ax6Fgydszu2Ac+pTDATNw9rXAHb8pWRVH93GyDs1vUxj+rcxBhrWbqPsLeuBBqTLxo98Lj+7icB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kt3rPFzO; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20203988f37so55467085ad.1;
        Tue, 27 Aug 2024 08:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724772470; x=1725377270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k7V95t9Eny7FjX1177LVW9tNDMS6rw8HF+Z0knd4Kuc=;
        b=kt3rPFzOXIuB6AIBa5ydOGnF5daJP/DdN1ec1zblYxVpOp0PbTB3Y552FwwtMlEvqL
         NLZhVy9PP/vnlmZY+RLPL6Mr2OL39Imgl+SJpPxWX+4/l6N3GNYU4Zrs6nbtetycSXzA
         doKJFmsWl1EAw+v/tJrzOHB0RtxMWJQuLK9+72Pm8Js0fHrlSqqCP0A0PvB8itZWbFPc
         ysQ+iToSmC7dwZy8+duaRLupb1MdZTM7pICbACEBtfV+H7NNOFWqHV5hpg/Al3nX6gQn
         3ibu6gU+Vn50COb8/B1qfvIsIq56X+hMlLLGi2F9Wk59JJEnB3dn90q9lcc2XcNTqDY4
         r8ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724772470; x=1725377270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7V95t9Eny7FjX1177LVW9tNDMS6rw8HF+Z0knd4Kuc=;
        b=NORGJ373fJvK1W/2MGjK0yvyiAqYxNL/RkT2rb9RIkVklkJnl7PK8f3yJKeOAWpLac
         7tzaePVD+6SUEZolcwwb/unb8708Z0YoB5u6jkIntLFjfapLT0j4tgu4PSP5toPWxggJ
         vp8nVJY1SDLA1d7+BiVv2FEaRI0uF0wGQmOLsjoT1X92ITLm1c7Q4hNozFK6Zxv8ud7J
         VOSr3Ozw2I+snh5wnNW1ikzhiKo8biJh7MBp04qo+jvY3CNn3Yv9AGGUrG7OOD9Rq+k/
         +WrCpAqnBQD33Pygim1Yjbfk6u4VasTsFeHCe+1e4dimBT1zdos3CXUkciOWHxWb39uf
         9Piw==
X-Forwarded-Encrypted: i=1; AJvYcCWB47ATWHdAW/An/mXIkS/YUEKfF5SceioqsR/a1BqiM0eba8thUPx7w13evflgq3H53tD4T2cDfB6cJJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDjQu+/x0vMeFZBOviTA9NS3A4SdqHtYHIlM4zgArQv7Cw0j/a
	D32kXvnL9tUkPmj3EMLQvtNO1CbJqadBZ1mfwc7IpFhSW3pfN3qU
X-Google-Smtp-Source: AGHT+IEPtmV8NBgh9Dnh9bO4NJM4SHx6FsWwQbk1pW18vK1HMdArx/2c73ChRv4IRCQbzDp60q+6tw==
X-Received: by 2002:a17:902:c404:b0:203:a0ea:6265 with SMTP id d9443c01a7336-203a0ea6d20mr198925725ad.11.1724772469523;
        Tue, 27 Aug 2024 08:27:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fce4:8959:e48d:980c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855dd2d7sm85222915ad.169.2024.08.27.08.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 08:27:49 -0700 (PDT)
Date: Tue, 27 Aug 2024 08:27:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Liao Chen <liaochen4@huawei.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, mkorpershoek@baylibre.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH -next] Input: mt6779-keypad - fix module autoloading
Message-ID: <Zs3wcpJ_vVmOXbIl@google.com>
References: <20240827123411.431388-1-liaochen4@huawei.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827123411.431388-1-liaochen4@huawei.com>

On Tue, Aug 27, 2024 at 12:34:11PM +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Applied, thank you.

-- 
Dmitry

