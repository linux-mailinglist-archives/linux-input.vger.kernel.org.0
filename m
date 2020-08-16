Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBAD02459A0
	for <lists+linux-input@lfdr.de>; Sun, 16 Aug 2020 23:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbgHPVO7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 16 Aug 2020 17:14:59 -0400
Received: from mail-dm6nam10on2074.outbound.protection.outlook.com ([40.107.93.74]:37217
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726331AbgHPVO6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 16 Aug 2020 17:14:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxHUB6lhlIA36i0cZ/hBevppwl7lV7+lvNhOT9eOdhAKXScEKdvk5B8g06BTx4eCUVJzkeVIPvVwCCKPnWQM6JH5oFUHoLPLyP6NPEsTXjqqV+knJPL9BzUpuq9PBgZMOFi/HzV7tWEhLUYN95Q3yt+AV3XwADBlkuXg0g6eCK/ZQMHNEzIhy1AhuMGnI38BoJq84nQvSY6vSC9rq79UEVqV3Qb9vpTC3alM7W5UsHVn5XOwZy2cE53FSvIDQfyEQD5l7z0scx9+Nm+VVgiO+Zo+O7rjdPBLu7TpGo77anrJYTLtrZ9XnpCbZfKNIRhfUZpAPyntAg/69X9IPj+g5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/vz/Alr+ZDKpwRJ0sr++56ei3Rn585imsA5zLpU+HM=;
 b=PC9ku/YwtC/A3DucOAjRYkp1nINbX+lgpWyICqlxbRHrRs8xKnH/oPbcZK8KgovsRlR5MyX8zZ2XS/3UafVdAkQUpI3Nyn8XDotG4SJRSolwYiuD9plkXn8kvRCRaRBK3eWJGHhl6eWVr1h3AfNSEtQ5tHAhvNpYX/fYZAXUSYqGVJGgFQJv062alrKkz5tPV8DgJihlFmhf0Ma3dlt4s2W2ycDwJdqQ/kXvS/zitr/TwIBkasxEtMUJCwJwx7eBPmp2RhYa6qkvo5ol4x+UTJlVlbUlWFaPNkrCEFslW2BP4U44KudfJ0JKyuw5BHV+VM5g+JZpjkYJWHD3t7TbNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/vz/Alr+ZDKpwRJ0sr++56ei3Rn585imsA5zLpU+HM=;
 b=QjOmdQLt4IhGsDcz88iObXHkYkb8/RE7Jk67+h/D9RCBUQJJRb5CPoWOdlH3BdYnNa00Rdf5NDanrqAuc4LasE5iCOsQPmAjPaD6E6dwzLXiK+zvCQekwoBgsa3XvopZzK0znPTttQkx92by3/+EQorkO1yn5CODEXdzluroOkU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Sun, 16 Aug
 2020 21:14:54 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::2ca3:f294:d154:6875%6]) with mapi id 15.20.3283.027; Sun, 16 Aug 2020
 21:14:54 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 0/6] Add support for slider gestures and OTP variants
Date:   Sun, 16 Aug 2020 16:14:21 -0500
Message-Id: <1597612467-15093-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: SA9PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:806:20::11) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SA9PR03CA0006.namprd03.prod.outlook.com (2603:10b6:806:20::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3283.27 via Frontend Transport; Sun, 16 Aug 2020 21:14:54 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2492d52c-15fb-4708-aafe-08d842296bba
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5631B7880D69F2C44A116B48D35E0@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJoGOIvF886TFZ49cUmznZv0QRfun6YHthYep7wAHso/WHNzMF4YvLGA1bcI6oLMiKA4pUtgiye+IXtNVrTk6PM50qIzN1Gjnc+qw0iKEMEO/b0iEMVnCtKOY7SP0aXuAU77KnmyhTm+FKqMvdfKR5hxngn7Gjsw0Wzoo3JizFYa3C7KA5AqCMUyi+0VY0sISLhxcKPRwpAWK1qQXnq8AsDFZnvbSs8sktFG8GgVqajttuJnGJ9fElQ3XxKomKiRlze7ii9Uo0agsoCPrOP9hpJxuxgsqFOmHksxLTB4gVNQs0FPL6HkTThmqANLnsUfkBzWepwwpfsT4Ptse3wR12Gvc1Er8nybz+yfySMS1i4gkwHyX5UyjxcrKBvugQ9As1pi1cWetZm9ybd3SBMmRqxiMhz8M2c9y7e34dSgprLcRlX9Y/zULzBEvckHBeo+l5OSv+t1IhAwqwVr3qyF7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(66476007)(6666004)(66556008)(69590400007)(36756003)(4326008)(86362001)(107886003)(2616005)(956004)(316002)(16526019)(8676002)(83380400001)(6506007)(8936002)(52116002)(6512007)(2906002)(478600001)(966005)(5660300002)(66946007)(26005)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: sdApREHvtoxL1JHzqL2OVTL2KVwS6keN7Em6BFAKYSEYbDbyJf0iM60EZSVnoWEelTB+D8Hkv8eNhH85VYcUsrJ776iXJMia8a3NmcggOSlRZjY/ZS2eIF3A7OGToq6uOwaH/KPoS0FqAg3o2pmlC4IJw5r+ROsb+z1Wb9F7rJvU1ZiXb1BAQmo/5mIBSganlfJMADxENSUaQx0pfg/XjHuins/9UiTP/j9SYBSK8hiBbEoFbRKdXCHiVb0krkuWGaRa4uslqos7XOVpVQimdxb7NdGH6ThNavo0Afm/0Rji2kwmYPwzJKLwRyf87coriKzcv2Ia1METto+0dwXJq5GuYuWbTbHvE+gd4G1KBpcdrmv1hLDiIkC6FPZmL5J+iP0uXbV+gYHN7s/kgpb6uO4Oor/MSLdm2Hw8zeK1RQMlB3Dc9xis5EuRBDWv4IO0VG/WJmm78Uq174Gr08rQtjsiOSArfS1Fj2SnYQm7Y365OObWjnNgjTyoEY8BWUmPmFqF0s8ECkuTKW1OBplbtFahWWUFyM5+uhykPZqACjiE9O1O7MPyijiNLYFAsMT5V496ABj7enzO6Gq2n3jq5YEVbxjz0WLprh9LnN78u4SL8K2RneyND0s8L/rNfOQuva5Bm67HGNjq/UDY0LjNKw==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2492d52c-15fb-4708-aafe-08d842296bba
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2020 21:14:54.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m60W2t40gz+QRFIEReQJcJfJxcl5UAOKpimAINKk4RLy96QaACDhtVY6nBvZCEYg1PBns8NYzEEIVETVO392gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
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
trade features or exhibit errata that require workarounds. Patches 5 and 6
comprise minor fixes and are included in the series because they require
patches 2 and 4 (respectively) in order to apply cleanly.

Note that this series is based on mainline as the binding patches require
086e9074f52f ("dt-bindings: Remove more cases of 'allOf' containing a '$ref'")
in order to apply cleanly.

Jeff LaBundy (6):
  dt-bindings: input: iqs269a: Add bindings for slider gestures
  input: iqs269a: Add support for slider gestures
  dt-bindings: input: iqs269a: Add bindings for OTP variants
  input: iqs269a: Add support for OTP variants
  input: iqs269a: Make sliders two-dimensional
  input: iqs269a: Disable channels before configuring them

 .../devicetree/bindings/input/iqs269a.yaml         |  95 +++++-
 drivers/input/misc/iqs269a.c                       | 325 +++++++++++++++++++--
 2 files changed, 387 insertions(+), 33 deletions(-)

--
2.7.4

