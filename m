Return-Path: <linux-input+bounces-15233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C3310BB596C
	for <lists+linux-input@lfdr.de>; Fri, 03 Oct 2025 01:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 80B594E3532
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 23:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DAD27A127;
	Thu,  2 Oct 2025 23:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP5CCEoq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD4A257AD1
	for <linux-input@vger.kernel.org>; Thu,  2 Oct 2025 23:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759446904; cv=none; b=Bco3vRaiA90d56U/GPDCAAu8IzP8Rfh15ESurldkp8Hmnng3PSmaf9NqXqwHrtdGxp6ZadwIWnJwPkDtvAeTKIR7y2OVDHIP+93CrKtyMPRRPfxGSd73GfUUvJgLFm/VAqZinYEmKXKHfY5SF09FaOqNytXS9Y8Op8Libeu4ENk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759446904; c=relaxed/simple;
	bh=CFUxqqUWV4kDg3DJZzAwd7Bgjzp0b3RCTAXRTQi7ZiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQY6vWGXZGSU2CU6rH/VDdo23+QKLxfSSR+CU14sJJVuCYP9y3957NMLPwnoiDFDqPlGqkkBRG0P22ACgGXxwAXo8yjd7xLu67ltB6hPDU7IGmJ7Cr+T4DO1ctx4/ARrOsLf/hVmT+OfH5/yvALHe7Lpm87zEnieADMXYL+jYfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP5CCEoq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so13946245e9.3
        for <linux-input@vger.kernel.org>; Thu, 02 Oct 2025 16:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759446901; x=1760051701; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CFUxqqUWV4kDg3DJZzAwd7Bgjzp0b3RCTAXRTQi7ZiM=;
        b=AP5CCEoqbgsfGBSty1tc3pNz+pQr60lI5d4o5D8W/jp9n/o1Dqjz6d3I6zLkOPhKyf
         OYxiC6Q5APwLUOdV9ZPBY3AztR51c3nCXT+8V9mCqIaS3E7IBQdW0nQ2lXLvJv8wUH92
         2H0Qiu0i2KubT/2QZgLFT8BzCgBhcmB7W3Ge/tCbVX9KPAMV/zGMMVkz3xacbr5q+VQw
         e6UhScpfq2yHoR3xB58oK3bJnqnruH2U1fOFeqmtuf7BPBAhFnoT+ZnI2U/4iTOiHUKZ
         cLMCaQohNv11K0Z5BSTM9vhjw+gcQK6gZNdvFCKMPVjHlBWFa66LlK6ZExK3lIlrWxqq
         CRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759446901; x=1760051701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFUxqqUWV4kDg3DJZzAwd7Bgjzp0b3RCTAXRTQi7ZiM=;
        b=Wn1n2hft/zC+KmPk57ETU6ui0tn2m4PsOBjmIxgUievj5g5dTYrfTmXAqLxboXGuc6
         d5FZdGrFyqPOHfG9tS+LuvFcRf9nq4+VmB10AUBx4ORNR9GTfCiqcyzMRcREovG1BF5d
         aydmV5dX6MdzpZNGJuC4zD+siroXdGh5+DuJjt6f6mRgX9nFu2wsZ8nvQj9/9LoT9bpt
         7TOpz1BdGD9tMlnz3D05dvtYJAYaxyLdB/vMa0uAnjkgWf0NUTcmBBYWA4Lvp04kFsAr
         OGRVmfhW3ZKeuHdp20cSlTZpp0qXuubFB9/vTxPA8G6WYSszGmFBEFQzEg/GCqcDv+Kb
         cS9A==
X-Forwarded-Encrypted: i=1; AJvYcCWG7IrB2XGUz4FdEH/Vk0VVazXHUPBWsEG1tbfcDmtuxuMtOB2bMv6lZbnv/Skezw0m43bkas3Plx5oVA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+gPNMNO34LqGzWINOnxpng4MiSkP1aaQfW8QxNEpBtgliWL6n
	wDI+ZAtXdVrNwKJNEDnVwfeH8GKzWFNmo4LjwhlMAEy63j/xMqprxlmFNzXL9AS7QAdDasz+WUf
	w8IFDo9RLaRNWlMXb+9GnWAHP7biCUWQ=
X-Gm-Gg: ASbGncubbH9ZSztpVAcKawIs0DTDarVwy+oUM5DGAW6X4fwlJ+FRG5foaOxXQLNo4xV
	M/zYFx6Avdaz6nk2DDyplUkdKyZItlIzGBkrRTaeSfUR11m8VAlHzmqJE7WrS4l15rmToyuofUe
	Z8jTzaZkPrL5ev3O/udYD4aRYFM149ZA+Fq2hkenXsSxsdSz327fI2IRxPXRyj0VwgBwOn4g4p2
	Xpnic9z++nQGYzKR7tXNAmJU9dQGviQ
X-Google-Smtp-Source: AGHT+IHG8eFVB/eCMDsv8lYeAbkBG0wcLhXMs0V+wgPCxLt7C2KCKMNaRgnGFlxxc/6u7ceJALMMx4dGaaLBIXRk5nA=
X-Received: by 2002:a05:600c:4fc6:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-46e7114ea13mr5346575e9.27.1759446900987; Thu, 02 Oct 2025
 16:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002193025.2066319-1-mavchatz@protonmail.com>
In-Reply-To: <20251002193025.2066319-1-mavchatz@protonmail.com>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Fri, 3 Oct 2025 00:14:49 +0100
X-Gm-Features: AS18NWDr8SDJRhNYcvKhrGb1nGdnOJc5TXYFUL8f-lLDkTfP0Sw0EzCDtyAX9Pw
Message-ID: <CALTg27ktQgzVBQ=Zdboc_+4UFjsJd+Tx+1D0CEqzeRnx=98aNQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Do not assume FAP in hidpp_send_message_sync()
To: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, bentiss@kernel.org, 
	hadess@hadess.net, lains@riseup.net
Content-Type: text/plain; charset="UTF-8"

Tested on 6.17.0 with a handful of other patches:
 - https://lore.kernel.org/all/20250927234834.2635483-1-mavchatz@protonmail.com/
 - https://lore.kernel.org/all/20251002192324.1991349-1-mavchatz@protonmail.com/

No regressions on my Logitech G915 TKL keyboard
No regressions on my Logitech G502 Lightspeed Wireless mouse

Tested-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Thanks,
Stuart

