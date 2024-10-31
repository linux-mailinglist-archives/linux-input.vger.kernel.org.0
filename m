Return-Path: <linux-input+bounces-7797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74B9B7569
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 08:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FCB21C24B63
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F312E148850;
	Thu, 31 Oct 2024 07:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8xhfoMz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729E12CDBF;
	Thu, 31 Oct 2024 07:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730360071; cv=none; b=a9ekL6sP87EHUiM86U6FdfsSxsspxzkgYgnfclHVVcrjQRkGcvnCiZnEELyTxtQBb/T9nC2XPBjHT9w4Qbmp1U6WuaOIPj3r6hTjO6bB2xGD1jJBmr6hnXop9m/eGcjLZxMK+JikJb4bdgxIajHMO2tnKNIfG/y00emPtUlCjFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730360071; c=relaxed/simple;
	bh=R+d1rvPf1Upw2x96aFkP3XmrIZmcUN4VUJ8eKnb1Nss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BWH5MPHjag3WXAGm5BqSLtE7izm9MxYsP27YBl/kljcJjTTUMsv08SVMK/WLeV3pDeEMVLhHkOWrbkmxud8dgmhiKs34zU1LqjCpxLGLdP1tkhOke702p6KSaRRh5pcSWPXfs2M4H8aFg8YOoHJ+7ng6f5gMftm2X12tGzUsvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8xhfoMz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so5422045e9.1;
        Thu, 31 Oct 2024 00:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730360068; x=1730964868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0nv1Ef1JU5GiFDLLue01xohdIXEr/pHWQPoV5z53c4=;
        b=T8xhfoMzdaH1yc/jVG9F7r9PJdGK8NZFjBhcZJTUJdM1LkzDzIRQ2sujV3gRqmyp+d
         e8eBvqT44Lb/ie6gPKl5p0Y2JOMaRmQCLBn3f7qKBiw7lAWF7btk9Nmv3QTQ6yoGpASU
         aJr8ELQmMk+4TJPuYfGrCyoh+gj89YUnMizhDl86nIoXxBfr2z2lc/0FaLehKULMBYJN
         NglG4Gc0rDuPGs6QH7xBYNJjazPYIIHUG4ofpgRw+m6nrWnPNEySW2GTBJB7ivKiaQzA
         ymlb3Mg2Go8qUdUVOWCdxpdKsHDP/bSp51151XzQac+BJWaz5VQLFRmVSOmk4RroE5VJ
         ufww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730360068; x=1730964868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0nv1Ef1JU5GiFDLLue01xohdIXEr/pHWQPoV5z53c4=;
        b=ntL6knMNzH0ZfkpFDHmf2n5RRYLSZc04RTIr0Q1pl7nR+d+4EQu1f6sJPIXh2kbv0m
         gv/Fryy7y3KYyYeLlTK56uDJ0qhaEL5yVhI5J5yzbzgR8D0DA6pwY2uO8hD4X3UlRXDu
         rs93frHsFBqAjUGPx17g7K/JwiwpNvjv3aZW6F4Oywdw3TJ5rxJ4GC0rF09QiIe6wDEl
         q3VoLYljXyCT9DgNvdUvzxXi7rPRJptBo3krQI2tucGa1NDIgBvbWA0LSriJdMb0DwMk
         hh6Fn3oQEBmZIBSIDuqD0aIlMAnOy0f0HpQX5bFvL5yjQ62Q4Z5PR0ioQ0IZr8c/fhdf
         AeTw==
X-Forwarded-Encrypted: i=1; AJvYcCVufs1M7QyFgJm/EA9/2e+QsZfEvWn8iBlb6T+r39WjtNAFg8drLgvXghE0zlIwZrZivCg16vItPrSLNQ==@vger.kernel.org, AJvYcCWGvBXfTjkVue4fkPNNMPJ7nCaOdBqjouFvcPM2kLUZCdhhaT3xUh7K12Bij+X1RlWKrLfKji7jP5W+23Ew@vger.kernel.org
X-Gm-Message-State: AOJu0YxrFL/E+2gAV2assvfN7La2BlhXGh3I4bdrzEoT46PTmO2IK2GP
	3YjKwkAaFYjtYPF397cDXXfzBTZKty+hLeJpR0CuYrClc4DEjmk=
X-Google-Smtp-Source: AGHT+IH+wT/ECKsH9J2zAtJ+6RsOUZ2zyASnULkKnSGpUjg9MZF/EXqITdG9nllRyo/zVTOX58licA==
X-Received: by 2002:a5d:4106:0:b0:37c:d558:a931 with SMTP id ffacd0b85a97d-3806115902emr13697640f8f.31.1730360067588;
        Thu, 31 Oct 2024 00:34:27 -0700 (PDT)
Received: from localhost.. (mob-194-230-148-189.cgn.sunrise.net. [194.230.148.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c116a781sm1248951f8f.96.2024.10.31.00.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:34:27 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Bryan.Kemp@dell.com,
	laurentiu.tudor1@dell.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v2 0/2] HID: i2c-hid: re-power-on quirk for QTEC kbrd
Date: Thu, 31 Oct 2024 08:31:40 +0100
Message-ID: <20241031073419.9189-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve keyboard not working out of the box for Dell XPS 9345 13"
codenamed 'tributo'. X1E80100-based laptop's initial support is currently
being upstreamed [1].

In present state, keyboard is succesfully initialized, however attempt to type
anything throws 'incomplete report' errors. When utilizing
I2C_HID_QUIRK_BAD_INPUT_SIZE quirk the error is gone, however raw data coming
from the keyboard is always the same, no matter the key pressed. Issue
'resolves' itself when suspending and resuming the device.

It appears that calling power on command one more time after device
initialization before finishing off the probing fixes this weird behavior, and
keyboard works right away.

Introduce a new quirk for such behaviour, and enable it for particular keyboard.
Vendor is shown as 'QTEC', however device id is reported as 0000. Given that
vendor was not present before, using HID_ANY_ID to match the device should be
okay in this case.

In v1 it was suggested to make a dedicated i2c-of-qtec driver, but I was not
sure how to proceed at the time. I have now drafted a dedicated driver, and it
really is just probe method being extended to call powerup command again. Given
that a similarly 'ugly' quirk was just merged to i2c-hid-core.c for a Goodix
device [2], and that (IMO) creating a dedicated driver for such a small change
without any plan on extending it will be just polluting, I am asking you to
consider this change again. Alternatively, if it is yet still strongly
preferred to have a dedicated driver to include this quirk, please let me know
so I can proceed accordingly.

[1] https://lore.kernel.org/all/20241003211139.9296-1-alex.vinarskis@gmail.com/
[2] https://lore.kernel.org/all/20241007222629.172047-1-marynczakbartlomiej@gmail.com/

--------

Changes to V1:
* Rebase on top of latest linux-next
* Update coverletter's reasoning and links
* link: https://lore.kernel.org/all/20240925100303.9112-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (2):
  HID: i2c-hid: introduce re-power-on quirk
  HID: i2c-hid: introduce qtec vendor, enable re-power-on quirk

 drivers/hid/hid-ids.h              |  2 ++
 drivers/hid/i2c-hid/i2c-hid-core.c | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.45.2


