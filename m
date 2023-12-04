Return-Path: <linux-input+bounces-474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E4B803B5F
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 18:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F3281F211E4
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 17:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70EE72E824;
	Mon,  4 Dec 2023 17:25:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 27BD8A1;
	Mon,  4 Dec 2023 09:25:19 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,250,1695654000"; 
   d="scan'208";a="185273244"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Dec 2023 02:25:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.142])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 46F144031BE0;
	Tue,  5 Dec 2023 02:25:13 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3.1 0/8] Convert DA906{1,2} bindings to json-schema
Date: Mon,  4 Dec 2023 17:25:02 +0000
Message-Id: <20231204172510.35041-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the below bindings to json-schema
1) DA906{1,2} mfd bindings
2) DA906{1,2,3} onkey bindings
3) DA906{1,2,3} thermal bindings

Also add fallback for DA9061 watchdog device and document
DA9063 watchdog device.

v3->v3.1:
 * Patch#1 is merge of patch#1 from v2 + patch#8 from v2.
 * Dropped comment for d9061 watchdog fallback
 * Replaced enum->const for dlg,da9061-watchdog and its fallback.
 * Restored patch#4 in series 1 and dropped the thermal example
 * Added Ack from Conor Dooley for da9063 watchdog binding support.
 * Updated title DA9062/61->DA906{1,2,3} as it supports DA9063.
 * Retained Rb tag since the changes are trivial.
 * Added Ack from Conor for updating watchdog property
 * Dropped link to product information.
 * Patch#5(onkey) is squashed with patch#6 and patch#9 from v2.
 * Replaced enum->const for dlg,da9061-onkey and its fallback.
 * Dropped example
 * Restored the thermal binding patch from v2.
 * Dropped example
 * Replaced enum->const for compatible property.
 * Added Rb tag from Rob and retained Rb tag as changes are trivial.
 * Added Ack from Conor Dooley for patch#7.
 * Split the thermal binding patch separate
 * Updated the description
v2->v3:
 * Updated Maintainer entries for watchdog,onkey and thermal bindings
 * Fixed bot errors related to MAINTAINERS entry, invalid doc
   references and thermal examples by merging patch#4. 

v1->v2:
 Link: https://lore.kernel.org/all/20231201110840.37408-5-biju.das.jz@bp.renesas.com/
 * DA9062 and DA9061 merged with DA9063
 * Sorted the child devices
 * mfd,onkey and thermal are pointing to child bindings

Biju Das (8):
  dt-bindings: mfd: da9062: Update watchdog description
  dt-bindings: watchdog: dlg,da9062-watchdog: Add fallback for DA9061
    watchdog
  dt-bindings: watchdog: dlg,da9062-watchdog: Document DA9063 watchdog
  dt-bindings: mfd: dlg,da9063: Update watchdog property
  dt-bindings: input: Convert da906{1,2,3} onkey to json-schema
  dt-bindings: thermal: Convert da906{1,2} thermal to json-schema
  dt-bindings: mfd: dlg,da9063: Sort child devices
  dt-bindings: mfd: dlg,da9063: Convert da9062 to json-schema

 .../bindings/input/da9062-onkey.txt           |  47 ----
 .../bindings/input/dlg,da9062-onkey.yaml      |  39 ++++
 .../devicetree/bindings/mfd/da9062.txt        | 124 ----------
 .../devicetree/bindings/mfd/dlg,da9063.yaml   | 221 +++++++++++++++---
 .../bindings/thermal/da9062-thermal.txt       |  36 ---
 .../bindings/thermal/dlg,da9062-thermal.yaml  |  35 +++
 .../watchdog/dlg,da9062-watchdog.yaml         |  13 +-
 MAINTAINERS                                   |   6 +-
 8 files changed, 272 insertions(+), 249 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/da9062-onkey.txt
 create mode 100644 Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/da9062.txt
 delete mode 100644 Documentation/devicetree/bindings/thermal/da9062-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/dlg,da9062-thermal.yaml

-- 
2.39.2


