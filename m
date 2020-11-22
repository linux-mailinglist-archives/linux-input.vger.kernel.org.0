Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C622BFC77
	for <lists+linux-input@lfdr.de>; Sun, 22 Nov 2020 23:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgKVWje (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Nov 2020 17:39:34 -0500
Received: from mail-dm6nam12on2083.outbound.protection.outlook.com ([40.107.243.83]:3168
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725782AbgKVWje (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Nov 2020 17:39:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFe1H5dKQYeUUlYvP1YSIZwzKK2sXLzgmmAePpSjA/04D31zj1k1nPrsN28BKyzxbtETe8nx+N2JjcLlibjel5cCgbL3oRyzefNXb3vq3jo8hxomwuspuKeFuqbBxL/rmNRDG9l379sVdOCT5c9JIqKgZo0CjqU2mFMfn1128RKCfoKqi+KuH9a4a/ThFLf/tT9bB4gkJhb0/HTH+ELONYsyba+9eGz0IleHyux28Yva1BQepn5wgY60B9KMlA06AC8RL7VP99NJKnMbVzAA861r1dQVr/jjktCtwJZb1fsdyKfD5NWcuHd8RH9KdhMeLEk16HzJISm/Ksb3OlQ/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDqA91T6F5+XKXa/TvrvyXPj24i4mDcDjxYIqFTBFXA=;
 b=ng66lrq9pzlKj5XvB1KX19VitSTHHxPOyf2+5JiSi9sBGC2itX8dzDOajLOK1rQqiHF6YB4kBKMdX0sFiOLAiV7tOb0hEPsHsPGfAZCaMpuH2+Rv7YIbOhLpw2jeWmOQ46JAQbwyi+JtYUg5WrH/DxvH0tSVkFdgr5N34nY8rqi/xPMnFiteYb3/iqbxKEsq562O8uAx2ceUc1wWoYxyw3YvwvNLBHeMMCktTVAUkppdp+4JjdphMuKr/nM5KwS5H0wLrLdiQPQllMyqzbN/yoNQzINbjwVhepyvudEpeoFn8mKLBtDhtrpxDsQFIpY3o5WcEXwQbWwm3UGxrF2D3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDqA91T6F5+XKXa/TvrvyXPj24i4mDcDjxYIqFTBFXA=;
 b=grk5I66MQXsCNAU0RivhfKysYxKrRqrV6d23qfte/W0jcXNlINv7LY73SFnfAmU0BBVXTN6V1FAsmTXfgUefSMwv7i9wikmA1Bwrk32pEURWnytqhc+eiwe3pdGpl48C8S+2zAMz/pI6I//gOWmPB2k9o/fATFy3TVgDPGP2vlA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA2PR08MB6604.namprd08.prod.outlook.com (2603:10b6:806:11c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Sun, 22 Nov
 2020 22:39:29 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::3cac:792d:fcf4:75a2]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::3cac:792d:fcf4:75a2%7]) with mapi id 15.20.3564.035; Sun, 22 Nov 2020
 22:39:29 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 0/2] Add support for Azoteq IQS626A
Date:   Sun, 22 Nov 2020 16:39:06 -0600
Message-Id: <1606084748-4097-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [136.49.227.119]
X-ClientProxiedBy: SN6PR01CA0017.prod.exchangelabs.com (2603:10b6:805:b6::30)
 To SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.227.119) by SN6PR01CA0017.prod.exchangelabs.com (2603:10b6:805:b6::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.20 via Frontend Transport; Sun, 22 Nov 2020 22:39:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3892a94e-95c0-43cd-fa8a-08d88f37796f
X-MS-TrafficTypeDiagnostic: SA2PR08MB6604:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR08MB660453AF846B40C2F0213A46D3FD0@SA2PR08MB6604.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HPAXiNzFbvAMMufwnL38BkErhbg6BilL/mVgaSPnOqtAZo0mCLaplE3xINssEG2Wi75tlijp96tlV6tR8DVD80HGrRttMefodRSRoAAKEiCFvzaosnkuLJ0Qbx3VzraQyMj0dQ43cIF4KrxrsfBO8zzXcqTYPlaPzVPuxJXz1bM4Vc2Q7si3BGeJTD30bGIuXNG7u8gje8YDV5goYuBEyIR7FrhIJgSj2EHXCyzSrzrEGuhCEasIesr8iO7WsX35H0AaLlLOCU7bMHiQw5wGPQ6GIcOykiA7IFOJ6YJDBQHBnT/I+g3OqPkgeXgpQYYSc+FMXKNnO7Id+U5HHXgkoWZjfsmFhXr65VI1c694mUkWrxrMlgSMX2ETUDRhJiG3SWLjEG2ATeNs+5KffV7RF2b26uzJT+b4hVW3073KLM5ArWJr3c6mgbiMS3T48gPnirtAhhl1SrVOAV7xGRURsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(396003)(366004)(376002)(39830400003)(6512007)(316002)(6486002)(83380400001)(86362001)(69590400008)(36756003)(478600001)(8676002)(966005)(4326008)(5660300002)(107886003)(6506007)(66946007)(66556008)(66476007)(2906002)(26005)(6666004)(8936002)(52116002)(2616005)(16526019)(186003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xUdyhq7cLzFXd6T3EjQ55u2CNSYx5QwWBG2K3WqU1JbmRRCfK9sUTPP9DAPXaiu3kZxxZ1HMPk3vB3cmv5Y2NuPyQnwDddmHP1QY9GUwOBf+pQWWqBIXds0RIgPyx7GIr4ddB9qJFl0MVB0C1vkfux308IzNqrAxpRc5ShuFSav4XRFLcoMvMWQnFnf1eVtFGQ/QVfNSH9QqFbk0b92AF4rpGr4bwLRQ8i03xiOvNSmYohxCdZw2+Q1niceFvLuC4L9O43vgnCDVDjxOAmlMQiuG1GkD/eUbt1pHJdSSjONFLuG7WPvafQUpQRfLUQ4ZZ+fJPlmvzANLW8P8fT3JPpbFfH6tEO6iLey8IIBr/tzyX2HEisgZsfkCJd9HkGuUb4iMzXALuxoZeaYnhaGLC7RMx1jc22bggoxTu9D0OxnMWlpKexbU20+bXjULOcQOhU8GRLdVe5/e3I7HQiF4EG71+QkmdrrqYpu6gVOnxnIE1c9ZSdPKsdc4YMPSDbSlUdpsAT9HoT07CR7aSk5EUEYtrKb1kzQAAQp1hQyvox/e121UZj8r3FbWpyzcs+qtmuXKM2DshsNyVRCEzZPG1YX/AzKdRiqSCVCe4fzW0Lw22NsUt3JUORAmJxOlHnV6SIrGlmaWnX0xnLgO2zsx0Q==
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3892a94e-95c0-43cd-fa8a-08d88f37796f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2020 22:39:29.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1OzNqnk2y0yk7ed2MHdAsz/BbpEeAKIPYe0T9gYK0l2slzqdtbPbvQLanHDQ5X87K5iNY4ssK6ncsow8ToFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6604
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for the Azoteq IQS626A capacitive touch
controller, a highly flexible multifunction sensor targeting wearable
applications. It is a close cousin to the IQS269A with the following key
differences:

 - Channel count increases from 8 to 14.
 - Channels are assigned dedicated functions as follows:
   - ULP (ultra-low power): a single channel that continues to be sampled
     during the device's lowest-power sensing mode for wake-up signaling.
   - Trackpad: a group of 6 or 9 channels forming a capacitive trackpad with
     gesture support.
   - Generic: 3 independent channels capable of capacitive or inductive
     sensing, plus much more.
   - Hall: a single channel leveraging a pair of internal Hall-effect plates
     serving lid or dock detection.
 - Each channel (or group of channels) has a unique collection of configurable
   parameters rather than common parameters for every channel.

Channels and events reported by the channels are configured using the device
tree, similar to what was done for the IQS269A.

A demo is shown in the following video: https://youtu.be/n0Q5BXYFIgI

Jeff LaBundy (2):
  dt-bindings: input: Add bindings for Azoteq IQS626A
  input: Add support for Azoteq IQS626A

 .../devicetree/bindings/input/iqs626a.yaml         |  840 +++++++++
 drivers/input/misc/Kconfig                         |   11 +
 drivers/input/misc/Makefile                        |    1 +
 drivers/input/misc/iqs626a.c                       | 1846 ++++++++++++++++++++
 4 files changed, 2698 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/iqs626a.yaml
 create mode 100644 drivers/input/misc/iqs626a.c

--
2.7.4

