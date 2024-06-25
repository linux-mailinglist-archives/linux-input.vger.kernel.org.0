Return-Path: <linux-input+bounces-4621-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8B917120
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 21:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB94F1C21072
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 19:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6863916D4C8;
	Tue, 25 Jun 2024 19:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i79RYAVT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD07E1870;
	Tue, 25 Jun 2024 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719343935; cv=none; b=b2RXtPyGWowkg+D8LuJ2eme3adm/nrvTW/wvPaY39ztvBWhF4fw+wz5ODsTuu9bQMTDq+Isnn5T5/zId/dY/rQUCpjRlP/1eDmgZzLtmTwMm0De2U7IO4APxmOjtJD3fOaiafx4w2YawGLl1WkGnYaFfLCq+HaZL2aSJGJlVrZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719343935; c=relaxed/simple;
	bh=4mNSmv653uohj1lwCml1cJVTD/0L/0f3oF5MPgOIdtY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LIHkVwwM5+5bftxLUz1yVVVc2k+he6yKcu5iPBaUzVgN/4XUR1NyEfJMxgBPHf2eRoBSYwchSQM0KBbNm79H8mD6Eu5Y49vnc8CnhDQHfojQO2lLAdDdT4D9h9NErkDKKQIWcPiFDBpXVOiHsB19mDfDh57Vn9w9oxcOjiu4Y3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i79RYAVT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-366df217347so3134144f8f.0;
        Tue, 25 Jun 2024 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719343932; x=1719948732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4mNSmv653uohj1lwCml1cJVTD/0L/0f3oF5MPgOIdtY=;
        b=i79RYAVT0F6WeVXKGQF4B/Snlus42HrJD6a44/3nXyV9VJxlsqEFRCfIgTpYnBbkpW
         llURXxWzzdcMaUOKXG9mDz2mYXvZSbxSeBEhWFNpp5YQD/ecXBWxN6Ndq800W6mQSJLX
         GGzR1xgbAT0+UCIP47wNIJ8tuNW990RbKvNCT/OpK7L1bQTyXUaFXkw/kb9jM2qGW8xD
         ptNwL2loaP+yjEjMP2EL/l25rrs+QIVBDHBE5gSJZzxlZprDap4KyNSzQOd0CaTDxvzb
         ysEl1+2H6ikUPvjABHcgVSxnZ9aHGBU1xxNw5+oJJ2qxe8AfgSsCcnciMg9L8R0giJek
         YTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719343932; x=1719948732;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mNSmv653uohj1lwCml1cJVTD/0L/0f3oF5MPgOIdtY=;
        b=VAopyvU8FUW6ce7/DF7dCbTNijxO6XUjFCYIYHEZpWj7guxBE5WJUD5mglJ66NEzBk
         iiBVUWgeFzZXzA1d0ZmZPzEbHqPdY3aSPoRiNdbY7rl/C6a3eZNF3NaHTm0r1Y/oqY7e
         XURfJuY1KVXHbEi/+XbzF/akiT1K9btrW74EgkWr8d01/6BGYziAa8QW+Imy+JpN8U/m
         yKCoBwk1LLJHacRnsXjKzmjLF9t+weBLA6ijE2wPVNMRJGJ5oqc7WoWLFRy2r9e+R61W
         5h43Z09z8N/k1Vf+1vf4rTmKi0XQQLKcR6c2LZ9oM013+Qu8eIM76iRLnuJa2SGG6hUW
         ozDA==
X-Forwarded-Encrypted: i=1; AJvYcCUILtJ6hxqPdkt6RSsQbyIBTQPOsu+MvxLPQ2cqWy0FBokYbvs34LGiouTUkD4U27OWJCT1dsTgBkoUIkQcHD2p1GvRH1bxdP2LHp19Yjp3CkygY6Vav2y9HM3hoN3iFUbjaFH0+JJuOt4=
X-Gm-Message-State: AOJu0YxisfEgKwYUMrg6PJNiEeHnC0V1o5ryqe/H+3edhfyQnW9TdSBa
	rNmCBfmP22ctXDYw0RLQ2sZC5esrfCZKNwMNQZg11PSFAR3j7qBdJxjTrCIZ0b4=
X-Google-Smtp-Source: AGHT+IEBjuhHU/XRd2UFE1UMNIEe2DMqIcnsHPp2AGMbS49xgvbFRYLiw8Ci8UZYcghgIovGtsbTzQ==
X-Received: by 2002:a5d:518c:0:b0:362:3b56:dbda with SMTP id ffacd0b85a97d-366e9463e46mr4924341f8f.9.1719343931910;
        Tue, 25 Jun 2024 12:32:11 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e100-e800-c687-22dd-17e6-d8eb.cable.dynamic.v6.surfer.at. [2a02:8388:e100:e800:c687:22dd:17e6:d8eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be818sm222084295e9.15.2024.06.25.12.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 12:32:11 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: andrey.lalaev@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	m.felsch@pengutronix.de
Subject: Re: [PATCH] Input: qt1050 - handle CHIP_ID reading error
Date: Tue, 25 Jun 2024 21:30:33 +0200
Message-ID: <20240625193047.35564-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.45.2
Reply-To: Znrs5QVAuSjH5sCT@google.com
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

> But how did we get into the situation with the chip being missing?

In my case, this chip is a part of an external board.
So, for example, I see this message in the case of a bad cable connection.

Also, I prefer to see messages with error codes instead of random values from a stack :)

Best regards,
Andrei Lalaev

