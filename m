Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4800526CCE7
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 22:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgIPUu7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 16:50:59 -0400
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com ([40.107.93.45]:10357
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726605AbgIPUu5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 16:50:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XATUIzh8i+kqCo4PJwTYNOx4NUt0pkdiLHj9Q5Fjx+3/bgAYJKQ7rxtexEfCIsBPt7oT6EPVUZwI3XtfQGF0qLuHvLXDKol5lCDdRAOTan3u6bpR90vjtB8mUGN/r7VJvsfVILTjc86D+kZMmvfjSqWIPWLTyLzhmXVrThW0bp4m7717+lsPnIvh4wIPhgelPujGsOvAAK5I8zS8o0swTs3FnRIW2oyeuytDnZWVcQk7KcPomDrUocpha2wj3ke30MtmEBAeFvwYbyAMYIiO10SlWcboVSoijVwiiEJ+vTYgFpaRiyB3TyXCUXZLYN7tHix89Ca9tiTCfCK1kuys3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv8mhwSVvD3KjnRxCDVhIyl9/NpZ+gyPsAhOjRqXzxs=;
 b=P60IjjqFEz6jeMMDxJ6Uy/tIAf50yHyTaxQHSbWScurrBt75TDpEhjY/16u6LLGcTUpMMqRGJFy+0LD4GLlw157P099ALa/uqFEchQGwkxVEGR0hZd9gNZ8O1c3lewNRKTV8MhWrZX2cZvi1z2RvMFjh6cw7KELU+NCnLp2ur5mlOhOmtsj6BqHovmhh3+unUH7mhQywniqiOkmUgs6AmwrDjfcqB98wDWzR66goMQMI0jip73ipYZUKbL0D+Yb67kuf5Qa29bvHrMRWM2GprxvgP/tOHt9O2fxHL5TnVWVZ6XvNwmr141rBpo25/t4FXrzz2dadYQClgirO34RuHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gv8mhwSVvD3KjnRxCDVhIyl9/NpZ+gyPsAhOjRqXzxs=;
 b=HH+tuRmE1Oajq4xIlChCUJoLuIN/TkcXVR8QdH3FZZgdNXnndLAkGIPk2Lv9sYm/p6CiGYEtmhUIUYSdzpr0uVVQdaVCllr1UpnkicMsWkQiaHsk94ZNUec8FW+j7RcttOBp4WVV7LeL+s/dMz3Fg70ORDhhIrvcM3gG2N3+wwo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4848.namprd08.prod.outlook.com (2603:10b6:805:6d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Wed, 16 Sep
 2020 20:50:51 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d19a:589c:d9e8:b5e2%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 20:50:51 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [RESEND 0/5] input: iqs269a: Add support for slider gestures and OTP variants
Date:   Wed, 16 Sep 2020 15:49:55 -0500
Message-Id: <1600289400-27632-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:805:ca::34) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR16CA0057.namprd16.prod.outlook.com (2603:10b6:805:ca::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend Transport; Wed, 16 Sep 2020 20:50:49 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a27e3a1-2636-4bca-ff0e-08d85a8231bc
X-MS-TrafficTypeDiagnostic: SN6PR08MB4848:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB4848C0698DF0D1AA7BD995CAD3210@SN6PR08MB4848.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sc2ixc7VGl4e/pS1S6K73UmcCSomM690gaykmPK8JiXBh/Cdt9iSN6Uk25PxH9ZZDAiNKUWfHWstcfx4zVrf46O/9dQ3eO3MfTZQ9T1+MzNs4cOWwvHAwVOLclHRjCTwPkPRAYLrjKw5ISH+ftj5Z+cKIfjDS/9xXTydSNl4qk1Ou+EycpKQbkhXwKzh6x8olskM/J4oLYcgk2nLrG7h9QkLO6SDs4M2DTHczX9pg9ulszXBtPHHkLEbWKlXVKYsFXu29fRMsuAoR+a0birXyts1EHwqwWawmiwZOsxzF/qWzjde/TXe6jNASGZzkjhPGbKU6ZgybrwDVYoBJCFA5+TSNsLbdgV1cNifCKgXizf06x9AUxM1gNDlULQDHWOL7h7L3+a2UJUDyIwemJY6NkLnZlnaucFlsOU4pKfbusAidjobpkWGezYGStvOmxbCU3cZnoraE704sBL/gF0gRoBc1QyHHQPptF7ywH66RoJ7nFHOd7JMzhK2rhTOZORj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39830400003)(376002)(346002)(366004)(136003)(956004)(316002)(4326008)(2616005)(26005)(186003)(2906002)(83380400001)(8936002)(107886003)(16526019)(478600001)(6666004)(86362001)(6512007)(5660300002)(69590400008)(66946007)(8676002)(6506007)(66556008)(52116002)(36756003)(66476007)(6486002)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: ECdzHag+TdacpQj3drU8nQMAFJwZFPk9PkE6YiVG890SXdGzAV3Co8bJujVffZrZcJhTmBsaDUv0r0ROMr1SRcMXxvxQzVUGyue8pV5AWYjZdGChTCdthkNIpUXr3/2ExfS4f7hZBD7e2czmhi+gZFVcr0GkK5WWTmT208SdcgqhWEspmyP41E3n1LhUZcoQ31qWTxAoA2H57r+d3Z1SwTxhc+4rZO3bbTkyM28ZRe9J182FfafmLifd9UsRV3lUgX26IbNZ5Ep0c2DqIQ8c50F8K8U6cAcb7D5do9oenqipDv72mTP0mf0Wdb9CFyF72csxbfFuqApT1n2xuDCCQgeHqjFJijxTpKYyVHaBgo4qVGwyQHrgziN1GpXkr7NKazuFryhOlbJZo75It+bPoYWWRgqA/ydgSZwceH3yKkNWL48hj6LZe1AC5NjoGjQpYCIaiCHXuPewi9Jm60+ho5sLPGn8hJdxDUlxFRNPjwOkzfCHzIyFWBO3AVf0FvJj+f22SKNJUdX8zReSa+udBSFGKYKXrw4u3Fo2aw6a/Cpug4bahItLLiQtRsTFr0zI3Zay5j9+9NgGerPrOT462MD0Y7NPPxTySPfCM78ns2QejV/1PO8pDzyAANX8B180G8oL6qVQ9u6q2J7x0C61cQ==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a27e3a1-2636-4bca-ff0e-08d85a8231bc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 20:50:50.8018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiL66NcPe/KrKvHtGDMMAXFeHyxDIF5HRMWTytrrlQkFhsa3PWC7vOqAQdEPTunPHe3bJkOuEFIkcTj31pGoDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4848
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for some additional features offered by the
Azoteq IQS269A capacitive touch controller.

Patches 1 and 2 add support for slider gestures (e.g. tap or swipe). Gestures
are recognized by the hardware itself based on touch activity across the chan-
nels associated with the slider. This feature is useful for lightweight systems
that do not post-process absolute coordinates to determine gestures expressed
by the user.

Gestures are presented to user space as keycodes. An example use-case is an
array of multimedia keys as seen in the following demo:

https://youtu.be/k_vMRQiHLgA

Patches 3 and 4 add support for the device's available OTP variants, which
trade features or exhibit errata that require workarounds. Patch 5 represents
a minor fix that is included in the series because it requires patch 2 in order
to apply cleanly.

This series is being resent with a previous patch 6 ("input: iqs269a: Disable
channels before configuring them") dropped, as a more optimal workaround that
prevents GPIO3 from inadvertently toggling during calibration has since been
highlighted. If found to be viable, it will be sent as a future patch.

Note that this series is based on mainline as the binding patches require
086e9074f52f ("dt-bindings: Remove more cases of 'allOf' containing a '$ref'")
in order to apply cleanly.

Jeff LaBundy (5):
  dt-bindings: input: iqs269a: Add bindings for slider gestures
  input: iqs269a: Add support for slider gestures
  dt-bindings: input: iqs269a: Add bindings for OTP variants
  input: iqs269a: Add support for OTP variants
  input: iqs269a: Make sliders two-dimensional

 .../devicetree/bindings/input/iqs269a.yaml         |  95 ++++++-
 drivers/input/misc/iqs269a.c                       | 315 ++++++++++++++++++---
 2 files changed, 377 insertions(+), 33 deletions(-)

--
2.7.4

