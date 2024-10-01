Return-Path: <linux-input+bounces-6948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3D98BE00
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 558172849FF
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6D81C578A;
	Tue,  1 Oct 2024 13:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="pen5dkuO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6211C0DFD;
	Tue,  1 Oct 2024 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789877; cv=none; b=dkBr1GUntaRhHY/3u+8XTrPNsVXrAKeCjbprNq8nnOyqxxJn6En2JoJVLCZnSWjX3TcWv5FOKjqodor1YqgQTgXuUI0RMX6x5qGHM61f6LXLQO9Pa6i41jKhmMGidBoOVASlzqecdz7qX3butSNy6iRktWRZZoZUGseyIAK0sb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789877; c=relaxed/simple;
	bh=8vG/Nq8PjADLAeb05hFFnc+JV4unyNmCQOSVklUXz8k=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=dr4eh+u+aerhA+cfPjmmigkXhtrst2Wvy6rv9zaAne5LAW3IraEnhviel23KCzpg36kAlTvPz8tYpBuCENTA1gQla9zBcdF+hisYEGIgHbUlgFyN0l0QT4pF4gI5PUDt7S+C5OoXq0GWHAILrZ50tbebTl6vayuIJO85xbfSik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=pen5dkuO; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491C26Pk017045;
	Tue, 1 Oct 2024 09:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=IsN/KWbT6WSk50X4SaXM5nhAaNG
	qqIIOC6cwVW/mdl4=; b=pen5dkuOqfbb/K2gLFKQ/gesHOwx92MLfO8AbXnUG7p
	19uGkI84MSC3ohMjCO5yd2JJRbMY3k3Xb7VbK1ojZZBtoy6rhDrjP8AgPrKOVNMs
	gYTXA5KIfl5FGywuLseFi/ufSLfbgiP9LLgA8RSRW+gouFDRUh/u20fqjjFQQbSO
	P+WuhDFC/yirzT8bR2szOwMwoJ2TLenqUR2zpgyP3UNssNlRuHlnnMV3mDkYm+1H
	HfuA0EfBj7ibFCRrEgZPEXLf+h59NuOpH+gwnbuovK6EjnTbY5UaQVmaml9XDFR6
	LR6xs14IWtrlgSk+p78w/kpTERMiiEAdERRce6RMf+g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 420c0dshpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 09:37:42 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 491DbfhJ054532
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 1 Oct 2024 09:37:41 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:41 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 1 Oct 2024 09:37:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 1 Oct 2024 09:37:40 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 491DbTeJ022143;
	Tue, 1 Oct 2024 09:37:31 -0400
From: Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH 00/13] Input: adp5589: refactor and platform_data removal
Date: Tue, 1 Oct 2024 15:41:31 +0200
Message-ID: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAz8+2YC/x3MQQqAIBBA0avErBswU8quEi0sx5qNhYIF0d2zl
 m/x/w2JIlOCobohUubEeyho6gqWzYaVkF0xSCGVMK3AWaGjjNYdWvcG/YnLHjLFL0Sj9Sy9ks5
 2AsriiOT5+vfj9DwvLXk1pm4AAAA=
X-Change-ID: 20240930-b4-dev-adp5589-fw-conversion-955b2f42da70
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mike Frysinger
	<vapier@gentoo.org>, Dmitry Torokhov <dtor@mail.ru>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727790102; l=1848;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=8vG/Nq8PjADLAeb05hFFnc+JV4unyNmCQOSVklUXz8k=;
 b=PK5JFlLodET4xSFMhlPJYxyXTslafQm7hISflms33XjvZknGGIsVyl13iXBjpAZtRFHA/tDya
 68uz9kXkGfrB8k844NRbBn9tYDWtf/y1u7dxXupn3WWjue0JoSgmY1Y
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: kMYYKOYHB_MqusoYc7OZbIl2azrvTEnu
X-Proofpoint-ORIG-GUID: kMYYKOYHB_MqusoYc7OZbIl2azrvTEnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010087

This series aims to remove platform data dependency from the adp5589
driver (as no platform is really using it) and instead add support for
FW properties. Note that rows and columns for the keypad are being given
as masks and that was briefly discussed with Dmitry. For context
on why this is being done as mask [1].

The first couple of patches are fixes that we may want to backport...

[1]: https://lore.kernel.org/linux-input/9db96c99c805e615ba40ca7fd3632174d1e8d11f.camel@gmail.com/

---
Nuno Sa (13):
      Input: adp5589-keys: fix NULL pointer dereference
      Input: adp5589-keys: fix adp5589_gpio_get_value()
      Input: adp5589-keys: add chip_info structure
      Input: adp5589-keys: support gpi key events as 'gpio keys'
      dt-bindings: input: Document adp5589 and similar devices
      Input: adp5589-keys: add support for fw properties
      Input: adp5589-keys: add guard() notation
      Input: adp5589-keys: bail out on returned error
      Input: adp5589-keys: refactor adp5589_read()
      Input: adp5589-keys: fix coding style
      Input: adp5589-keys: unify adp_constants in info struct
      Input: adp5589-keys: make use of dev_err_probe()
      Input: adp5589-keys: add regulator support

 .../devicetree/bindings/input/adi,adp5589.yaml     |  310 +++++
 .../devicetree/bindings/trivial-devices.yaml       |    6 -
 MAINTAINERS                                        |    8 +
 drivers/input/keyboard/Kconfig                     |    3 +
 drivers/input/keyboard/adp5589-keys.c              | 1397 +++++++++++++-------
 include/linux/input/adp5589.h                      |  180 ---
 6 files changed, 1254 insertions(+), 650 deletions(-)
---
base-commit: c7bf046925dc5885d9c4d8fbcbb7e4e73665bfcf
change-id: 20240930-b4-dev-adp5589-fw-conversion-955b2f42da70
--

Thanks!
- Nuno Sá


