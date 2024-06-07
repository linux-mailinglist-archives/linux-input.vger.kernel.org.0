Return-Path: <linux-input+bounces-4224-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18114900AEA
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 19:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 986CBB22505
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06B914EC7B;
	Fri,  7 Jun 2024 17:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dqm2uRLl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7DE196DA5
	for <linux-input@vger.kernel.org>; Fri,  7 Jun 2024 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717779815; cv=none; b=gSJAgw4o1Mg7iGszM2p0fsegV3OTnBoRzcP/PB0pPq4bzdWGe9Ix70IzXaiA8Z47PNEv7gcYiHEanG+XNwS6JSnBlExRpnkuuCQtVu+As31PXcvpZDuvSOLf2kkkMO1dk1yd64MPFafgLUC1yEljLEHZ9kgc7uLosJ132Ocpua4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717779815; c=relaxed/simple;
	bh=i0v3Pgeq+IMesWEB6AQSP9LER2FNbxR1ZCqootTAEFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VXVH8g+xaem6qtK7d33V5qS50MpWwisyiB1g9DWYQ9y5sSq+IvGH2ElpeG5m4o9Vm9XFktgHt0ma26O6x6XrUDF+DwyBlGfIIqqCpneYOUNOKfuw3/eTJjWDqRQfJkxyiUvGfb5k6TKxW94HZpJv4cVNHujv8l3BOqD9qFuSTdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dqm2uRLl; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7041b6b7be0so345118b3a.1
        for <linux-input@vger.kernel.org>; Fri, 07 Jun 2024 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717779813; x=1718384613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SPh1XG7OKPHXmVBg8lSEqInQF90UPXcUP7a+mw0fwSY=;
        b=dqm2uRLlP+dDS9NGeAAzAn3O3bxbg6u5UvgZlvtUR5nEf9LUA7GZYgDfgQzDqbJ1g6
         KvTrITrDbVbZyRjg9VYagobRPQdsUXye3HhkhRmKbuoPxgAXVhmkBh0PcomWxQAnLUIy
         Oz1bwZMUDvszIHN06rXw8CRVjAw6zmpy8zXBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717779813; x=1718384613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPh1XG7OKPHXmVBg8lSEqInQF90UPXcUP7a+mw0fwSY=;
        b=cVtZUKqBdvITWk4hEAhFCGVShKQH89kZ2jGn0eVccGXH2nRp/SwGn/05i7dwE3ZVOe
         DxAM1NYWSzaGx++WitSemCDY9zg4nKE4do4f7gYaES0OGEggph3QTdCRSczxQeS6N/un
         8ielUZViS43LPbg9z2Ns83CQY7CByDU9CHozjPg/eSpoNfdDSBXF56UnBLmgUq6j0ZaH
         Wl6EXgpgiJmmdqWekCs1tl2Jd0fYiqPt1SYW5qsjLq3qo1lIZtovB2pUVlYuMP4tmruw
         /dnu09a8q0bUQ0NyzQM2cwsd9CmdFbVEkj3GTK05AEDV6S+/914WgeW6YAARHQgNNbIN
         O34Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKrAUR/bMTWgMuO5jCY90e4xmSS/sf5q4J1It0W6ECkTz2OrFVMQfmNwqP4uW2bkTqph+ZoFnvixbJPdmbJIDo+rvw9kPKYxHL8Mw=
X-Gm-Message-State: AOJu0YwWHou/oU8NMSmkFutC2ofS4jOR6aET/Rz2tWz1nk98RbWoqUt9
	9NbKayKGEYaiMEO6g4HuayIcyzbAo5fN9ua7m/HdSWGDqPehrMQoL43rkDxUYQ==
X-Google-Smtp-Source: AGHT+IFtw46qtyb1UN3CGT1XSYzG6p20xOQSgcqCSxXmF+1ED1932FuZSayNwtcFsfXC08B84+z8rQ==
X-Received: by 2002:a05:6a00:18aa:b0:702:496d:d8b5 with SMTP id d2e1a72fcca58-703f8622841mr10847793b3a.6.1717779813394;
        Fri, 07 Jun 2024 10:03:33 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:98ef:4953:160:1c67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e439d12cf5sm970705a12.67.2024.06.07.10.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 10:03:32 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Pavan Holla <pholla@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/3] Add cros-ec-keyboard v3.0
Date: Fri,  7 Jun 2024 10:02:55 -0700
Message-ID: <cover.1717779167.git.dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds a support for cros-ec-keyboard v3.0, which uses a
reorganized and larger keyboard matrix thus also requires a protocol update.

---
Changes in v4:
 - Change subject line: ARM:... to dt-bindings:...
 - Add description about keyboard matrix v3.0.
 - Add cover letter.

---
Changes in v3:
 - Remove CROS_KBD_V30 in Kconfig and macros conditionally set in
   cros-ec-keyboard.dtsi.

---
Changes in v2:
 - Separate cros_ec_commands.h from cros_ec_proto.{c.h}.
 - Remove Change-Id, TEST=, BUG= lines.

---
Daisuke Nojiri (3):
  platform/chrome: Add struct ec_response_get_next_event_v3
  platform/chrome: cros_ec_proto: Upgrade get_next_event to v3
  dt-bindings: cros-ec-keyboard: Add keyboard matrix v3.0

 drivers/platform/chrome/cros_ec_proto.c       |  27 +++--
 include/dt-bindings/input/cros-ec-keyboard.h  | 104 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  34 ++++++
 include/linux/platform_data/cros_ec_proto.h   |   2 +-
 4 files changed, 157 insertions(+), 10 deletions(-)

-- 
2.45.2.505.gda0bf45e8d-goog


