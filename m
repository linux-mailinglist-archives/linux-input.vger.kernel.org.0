Return-Path: <linux-input+bounces-7241-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD0A998820
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 15:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AD7E1F244CF
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 13:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8B5F1CB328;
	Thu, 10 Oct 2024 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="HgRtuZwh";
	dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="oR70C1Fc"
X-Original-To: linux-input@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA5E1CB302;
	Thu, 10 Oct 2024 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567973; cv=pass; b=FhDdfyFk9asubKECecDwMQF2L6iUJ7o7u0CNC1FqrQt48b/+ve2kNjGjxtOMoz5hY2FJWuRCncZnHpNVgJVuvyF6MugevFYpwx7hZv7iWG4+3E4lHQKLbBJrNTJQ0r4VyP4JDpw7rkaYz4In8cGi8vlR6jJeB1SCf/3Oh1M15ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567973; c=relaxed/simple;
	bh=HVZjHWLh6w7DVjdC0TJHjvM0h4Xpgg9eAuCCRfCzSW8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BzBPBEb6g6uUb7TCFMKN2FbuKMvLy5cGUf44XDucYFctkH8x/weJta1fYlFAhZRJvKrSXHdmJNy99pw3zOcKBEgNmRcyiqJLWw0fkkVve5xBWTxvbNExgiJ8L1WcilybL2YzDnw17gfelENvtuoxRg/976J9jRaTgH0LnwEu7rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net; spf=none smtp.mailfrom=gerhold.net; dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=HgRtuZwh; dkim=permerror (0-bit key) header.d=gerhold.net header.i=@gerhold.net header.b=oR70C1Fc; arc=pass smtp.client-ip=81.169.146.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gerhold.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gerhold.net
ARC-Seal: i=1; a=rsa-sha256; t=1728567944; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YmgwRZ2ldTSU/22i5Osqg1a3zPnLC3SF7IsBWltegf3zQ/1PFfDVI+CqnA+uhDi8Ym
    wY1XJDeAbFP/g+TLT01imM5WpoJOQ4DqpRKU2bm20xV9CVXe2Omk0ogs1MwugSpHo0CG
    chtCU5dPQiPbk7sQNE4sJP/exJ+rNIHD0BThkrOI+LerV5QYgJqLyed8WI7aF5jGOfa8
    ERRGg+LyJe9rWdeaFGst/HMT/uifUZweO6sT8TXxCxvqXeeEohgz/mOYZ2JG491aR1gI
    Rn148npFyKirYFuCcblpZ4joR+9ASeNByZE5MCttJo4dEUfkXJLSJpdjTWa5cXQCdysv
    exMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0002; d=strato.com;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=ThM8N/y8RVlQfAjUYQQhET5l1auwZ3h1kIYVJ/ZsmeI=;
    b=gb+yc9T7Idz8tjkaEJ014a8azYYtCdwO0gZfTrGG963MoxiXabdb/HJlxWCJTlsAvp
    kVjSHVkKzlFT7h1/q4zZR6O1Z+j+iUymh8LobAu4taDMVEa3ZpyLjy9vzC5RyJNYUYKz
    /eF0YSbAR13BDGveValgyFwLbQ0Cgz03SuPlu1rYuRVqWjukOKiaVx3aD8bHJQ+DicAM
    ejODaikd9od6auppwqQBjU+d7HkgkofKYz5WZ++WGycmLWIsq9owJ7bLyB8vRJAXW9sL
    WIblijmNFjfjnQjy+l8wKLORlruxmsKfRLppip6GYcCXyN30Rgn/YGHYuSG50mttU9K4
    xlPg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728567944;
    s=strato-dkim-0002; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=ThM8N/y8RVlQfAjUYQQhET5l1auwZ3h1kIYVJ/ZsmeI=;
    b=HgRtuZwhqFFIb1KD5chMHmEwZl2A/kc1/q9/jZI0vMe9hCAcKr425dv2nRvOjCbvL9
    B4bXPse+gO3dJuYLW0bFxhQuiVtpKBs50I/rSqUo3gkpS887A3ABqJVv+OCk1EVOrEGa
    AExlI4R8O0qfdhAbnKH+BPx0x/B69/HdSihAYcIWcJrJJOP8WanW9Io+RAoCwHVNImXB
    BDJlMz1rCZIfvmaEVy8qI+Bg9kSAo/+pRohXxebzSsYFHcKlfEOoq2FgjUJSciOK8Q9c
    HTtrtpJQDyveE9u96mwdAW54/zMeFjFE6EPYUXHAk844MCJLCU2HrmtBRv0FtpJdlmZy
    nzcQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728567943;
    s=strato-dkim-0003; d=gerhold.net;
    h=Cc:To:Message-Id:Date:Subject:From:Cc:Date:From:Subject:Sender;
    bh=ThM8N/y8RVlQfAjUYQQhET5l1auwZ3h1kIYVJ/ZsmeI=;
    b=oR70C1FcncAgd1gxdieaQ31OQiMGSa2r09M+ahkJwOEb6u6xIabPF7QeZqoEerjDi+
    QotKBfXjSAtjRhCmaTAw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXSOYQGpRtZhZnncGoRCMF/3aEZ/InzRrReCnzIuT5eMHSlE941iZFlw=="
Received: from [127.0.0.2]
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id R0d46809ADjhxFZ
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 10 Oct 2024 15:45:43 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 0/2] Input: add Himax HX852x(ES) touchscreen driver
Date: Thu, 10 Oct 2024 15:45:31 +0200
Message-Id: <20241010-hx852x-v4-0-7e6a20177938@gerhold.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHvaB2cC/2XOTQ6CMBCG4auYrq3pzFBoXXkP44KfAZoYMIU0G
 MLdLRiJxuU36fOmsxjYOx7E+TALz8ENru/iSI4HUbZ517B0VdwCFZIykMp2MhonSYlVFWYZEaK
 Ijx+eazdtoest7tYNY++fWzfAen0nLNAnEUAqaUvgoq41pVxcGvZtf69OHY9ijQT8gqR2iBGW2
 iDYJCsQ9T+kHYLCZIcUYQ4mfp1yA2x/4bIsL3sje/cQAQAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Jonathan Albrieux <jonathan.albrieux@gmail.com>, 
 Stephan Gerhold <stephan@gerhold.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0

Add DT schema and driver for the Himax HX852x(ES) touch panel 
controller, with support for multi-touch and capacitive touch keys.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v4:
- Fix asm/unaligned.h -> linux/unaligned.h include renamed in
  commit 5f60d5f6bbc1 ("move asm/unaligned.h to linux/unaligned.h")
- Slightly increase delay after reset to fix init issues on some devices
- Link to v3: https://lore.kernel.org/r/20231024-hx852x-v3-0-a1890d3a81e9@gerhold.net

Changes in v3:
- Fix device_property_count_u32() error handling (Jeff)
- Properly handle errors in hx852x_suspend (Jeff)
- Simplify error handling in hx852x_read_config() (Jeff)
- Close i2c_msg array with trailing comma (Jeff)
- Clean up error handling in hx852x_power_off()
- Link to v2: https://lore.kernel.org/r/20230930-hx852x-v2-0-c5821947b225@gerhold.net

Changes in v2:
- dt-bindings: Swap required:/additionalProperties: (Krzysztof)
- Use dev_err_ratelimited() for error in IRQ thread (Christophe)
- Use dev_err_probe() consistently (Christophe)
- Improve error handling of hx852x_power_off()/hx852x_stop() (Jeff)
- Add linux/of.h and linux/mod_devicetable.h include (Jeff)
- Fix %d -> %u in some format strings (Jeff)
- Fix other small comments from Jeff
- Link to v1: https://lore.kernel.org/r/20230913-hx852x-v1-0-9c1ebff536eb@gerhold.net

---
Stephan Gerhold (2):
      dt-bindings: input: touchscreen: document Himax HX852x(ES)
      Input: add Himax HX852x(ES) touchscreen driver

 .../bindings/input/touchscreen/himax,hx852es.yaml  |  81 ++++
 MAINTAINERS                                        |   7 +
 drivers/input/touchscreen/Kconfig                  |  10 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/himax_hx852x.c           | 500 +++++++++++++++++++++
 5 files changed, 599 insertions(+)
---
base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
change-id: 20230816-hx852x-3490d2773322

Best regards,
-- 
Stephan Gerhold <stephan@gerhold.net>


