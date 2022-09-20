Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D6B5BEDF2
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 21:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbiITTkW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 15:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbiITTkS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 15:40:18 -0400
Received: from mail1.bemta31.messagelabs.com (mail1.bemta31.messagelabs.com [67.219.246.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E48303E8
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 12:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com;
        s=Selector; t=1663702816; i=@lenovo.com;
        bh=iM79aHLuHeYl6fzqr8y91kMeQjqdAcli8LbhM2ooqwo=;
        h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
         MIME-Version:Content-Transfer-Encoding:Content-Type;
        b=groru93bun1xuvk8ZofOzWBPUqqPSgAR33+amaOWJ4r1/XrHUWDT1+zWGhKKcqOAU
         Ol/CQ+H0/p1NYyoXgIhPn7U4AnykBMKQh2Yn0EvznvraM3S7TS8rkW1CgByzHdUggN
         HIPIxw6KbAhPDXrinALPi19Oc9Ndwor27TJtyslpfH0UzRuIjDjLetGXFfu8kVWq0G
         hJ2RL+RYPmsDxUeuSP1KQI8zbZG4tOpAyYM1EdtkthQ7PMHOxj8+T686vKe4glKETy
         Gv7PnTpm31wY+/mrADFdlJvs83okDq2nGYf6ct11K9lYI/yAiNd3PYH4OQLwieuoPZ
         4/12KbhJxgi1g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAJsWRWlGSWpSXmKPExsWSoZ+npysvrpV
  sMOWCmsXhRS8YLW5++sZqsfHwD1YHZo+ds+6ye3zeJBfAFMWamZeUX5HAmrHgxCyWgoccFWf2
  PGVqYFzJ3sXIxcEosJRZ4uqKK2wQziJWiau7P0A5fUwSM+8tYwFxhARmMklcWX4EytnPJHF48
  kTmLkZODgmB44wS3avcIRKdjBK7t/5gg3AmMEkcXLuPEaRKSOAJo8SyR0EQiRdAHRN3s4Ek2A
  S0JbZs+QVmiwgoSsw4u58FxGYWCJDY97sVbIWwQKDE7k3b2EFsFgFVieX9C8FqeAWsJLp3bWO
  FOENeYtL760wgNqeAmsSWSVfYIBarSty90wlVLyhxcuYTqPnyEs1bZzND2BISB1+8YIaoV5b4
  1X+eGWbmv5mzmCDsBImef4/YIGxJiWs3L7BD2LISR8/OYYGw7SWOfPoIdY+vxNMzjVC2nMSp3
  nNMMDN3brwNVS8jMXHPBZYJjNqzkJw3C8l5s5Cct4CReRWjVVJRZnpGSW5iZo6uoYGBrqGhia
  6hrpGpkV5ilW6iXmmxbmpicYmuoV5iebFeanGxXnFlbnJOil5easkmRmCySSli/LODsbPnp94
  hRkkOJiVR3t5vmslCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhniGglCwkWpaanVqRl5gATH0xa
  goNHSYS3QggozVtckJhbnJkOkTrFaMxxZdvevcwc53fu38ssxJKXn5cqJc77TxSoVACkNKM0D
  24QLCFfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM6wKykCczrwRu3yugU5iATrmhog5ySk
  kiQkqqgUlu+iG+52UbUy9IK5f/e22Zfv8Zj2Vas16t8D23dp7zlj/+HouJT99s6P/H9Zz4/lM
  Jx9+qzl3WKtWWs4sx7Brjn4I5XDdPek+SebGkUjaxR/SlwwWd4NrtTlyfQxZnGG/d5ioxW8M5
  7lCD4rnWsLb4C5mh9RcspG2WfSl6vuiTf+gndRezJIZb75fuconcsXmPhenSVWd6XJYx/nCZ/
  eWDubfq7ei/dZ4bau+K3vjUejWh31flrvDi/VbXNsgk/FViTdOuS/4w+7XRqjfXPO+dm7+hYW
  8qo2XCwgPrX8e5LrafMNfVdDKH/+X41p1HhSLTPPeyvLf+nZvW+6P3+dKj77/rhCxfuPPPHoP
  9WQpKLMUZiYZazEXFiQCD3dz+QwQAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-21.tower-686.messagelabs.com!1663702814!393185!1
X-Originating-IP: [104.47.110.46]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19603 invoked from network); 20 Sep 2022 19:40:15 -0000
Received: from mail-tyzapc01lp2046.outbound.protection.outlook.com (HELO APC01-TYZ-obe.outbound.protection.outlook.com) (104.47.110.46)
  by server-21.tower-686.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Sep 2022 19:40:15 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LBatLvuIIukGm6puChgxIhskmDH54jq/PfxmNy7qt3b6CqrsYSSpbPomwTOn5O2zy2jF7Dv+o+jdD2+bGmOe6PY4Aj3NS/IEHWIOWS3XRAxO4UTv/pDwf+m3v9MLdf8DwT43/G65Zbf5uON+DprKQOsxA59p2iGsJIWtiISE+VlyoSua+SvSIT+QlL101/aYJN95jjJ3VaYvuuOYaYuoGItaknwRZ3uSjeYNqaCahEvr6ko6fS1jZGpgOtmGdev0F1oUmZBWaqpDI65enyzgZ9I4W9OvrfzibEVgcZidEBIndymAmrboj73YuEnFXADz5N8g7LIBtB4XAThDwFAQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iM79aHLuHeYl6fzqr8y91kMeQjqdAcli8LbhM2ooqwo=;
 b=d95bTiBPzQxDS8v9jfMdcE7A230wVIb0+Xinls2tqd4rrjLuRUWyVjXo+NoAw3lKvdFVfcQFoYMcQUqFbeZ4Sj7NXFBJKNyVpFCdFWVscu+voCH0yB/53qZ8+nOtrSJNENaYlT4l3yhsRJDLH97sxjrB1hsQ02UCTq5AR4gIeR7KCjCL5qRnvPtj3CTmMu9bpCb+97dc1Sf6dcjCBX6MfeKWK7oILm1hh2PLOKgHQA0CqKL+3fwlN6qnRC4YR83n4xfQANQ1ptbRtyLH/X174mlEh+oW3ElgKripkytaAavyOEmrwA4lsyYLqQXPgnmyB0BxSR8HElKPJKxS7XAbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.232.225.6) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=lenovo.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=lenovo.com;
 dkim=none (message not signed); arc=none
Received: from PSBPR02CA0007.apcprd02.prod.outlook.com (2603:1096:301::17) by
 SG2PR03MB4486.apcprd03.prod.outlook.com (2603:1096:4:8c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.12; Tue, 20 Sep 2022 19:40:12 +0000
Received: from PSAAPC01FT065.eop-APC01.prod.protection.outlook.com
 (2603:1096:301:0:cafe::4d) by PSBPR02CA0007.outlook.office365.com
 (2603:1096:301::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21 via Frontend
 Transport; Tue, 20 Sep 2022 19:40:12 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.232.225.6) smtp.mailfrom=lenovo.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=lenovo.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 lenovo.com discourages use of 104.232.225.6 as permitted sender)
Received: from mail.lenovo.com (104.232.225.6) by
 PSAAPC01FT065.mail.protection.outlook.com (10.13.38.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Tue, 20 Sep 2022 19:40:12 +0000
Received: from reswpmail01.lenovo.com (10.62.32.20) by mail.lenovo.com
 (10.62.123.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Tue, 20 Sep
 2022 15:40:10 -0400
Received: from localhost.localdomain (10.46.48.29) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2375.31; Tue, 20 Sep
 2022 15:40:09 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <linux-input@vger.kernel.org>
CC:     <markpearson@lenovo.com>, <snafu109@gmail.com>,
        <dmitry.torokhov@gmail.com>
Subject: [PATCH] [PATCH] Input: Disable Intertouch for Lenovo T14 and P14s AMD G1
Date:   Tue, 20 Sep 2022 15:39:36 -0400
Message-ID: <20220920193936.8709-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <markpearson@lenovo.com,>
References: <markpearson@lenovo.com,>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.46.48.29]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT065:EE_|SG2PR03MB4486:EE_
X-MS-Office365-Filtering-Correlation-Id: 8845ed89-2738-4815-96f7-08da9b3fef57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCngb1iNg+oYUzFBh36/CJV7tButuZtVIkppimJuLlQ9Xbf9LcAYlFD8UxH+BNxvqfBMYnCNgDsG+oMyHAxS+WstRJoSyap/Ur+4o5leFaHm6cdWknnLW4oS7LdIihY0jMUwBbj922G+g9miU0sp5NbksVpZMBIryOAy8uSYCB4dF4+PMMfdJWK+j6vPLkav1R/LHO4KNJy2rlcEARNI4B0MDJaJql2ow8jA+rzMEFaISHOtqJ452OhlDf+qRN4iyFCFe37Ju4nb/Nsgym0weyIrR1pJ43zz/HfhQpHGSP6iwFjSlFmrew5lSZJyoN8wNB0jTonVUGDwmBw920vngMaIcyh91wuEQGwUgPQR7nt3sg/VDHei9PuVW79FpgZRhzVCYLXn9FLFcj0ohjnHzNMMpKas5Lsvk3KRj/bOzSpBHS+5NshKh+BDfqrmaypRBj1CzH0NbtRh2QxfafQSDNYXNsZpf6g3XD8ffb95aitoFiq7CGvg9txZ9L9QGAXuTt3vOK2jotdj+YYTHqcAxUn2m00HeGcbOG5eLHiT+F7TA7WxTdd6WZFUYpICkwTj4oL+1ueNt4trFuCq0m3Y0Q+g6NZmxLU5/DH5LjHyaiilVGjTvA+PR0ENKZ1ptlm56NDxHx/GtFg2AvAUoKmei5uibRaS/vt5gTSNF48JiRdWkG/uyHKexxULM6DrSYoCoTdCy/crGiGy6JNooq7ThxEGpPruPqQsMYAcxBgjOMdWxx5J/vUdKqe+r2QxnQIDCtkoTQQkJoYVhuEI/c0Eai3wncXhmYJY8o0AR82b9JBTmaZ+PzBrvd4ltZvU9PqT
X-Forefront-Antispam-Report: CIP:104.232.225.6;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.lenovo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(426003)(82310400005)(336012)(54906003)(1076003)(6916009)(2616005)(5660300002)(36906005)(316002)(47076005)(16526019)(186003)(8936002)(356005)(86362001)(26005)(2906002)(4326008)(40480700001)(36860700001)(82960400001)(82740400003)(40460700003)(478600001)(8676002)(41300700001)(70206006)(36756003)(70586007)(6666004)(81166007)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 19:40:12.2867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8845ed89-2738-4815-96f7-08da9b3fef57
X-MS-Exchange-CrossTenant-Id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5c7d0b28-bdf8-410c-aa93-4df372b16203;Ip=[104.232.225.6];Helo=[mail.lenovo.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT065.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB4486
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since intertouch was enabled for the T14 and P14s AMD G1 laptops there
have been a number of reports of touchpads not working well.

Debugging this with Synaptics they noted that intertouch should not be
enabled as SMBUS host notify is not available on these laptops.

Reverting the previous commit (e4ce4d3a939d97bea045eafa13ad1195695f91ce)
to restore functionality back to what it was.

Note - we are working with Synaptics to see if there is a better
solution, but nothing is confirmed as yet.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/input/mouse/synaptics.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index 434d48ae4b12..ffad142801b3 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -186,7 +186,6 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN2044", /* L470  */
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
-	"LEN2064", /* T14 Gen 1 AMD / P14s Gen 1 AMD */
 	"LEN2068", /* T14 Gen 1 */
 	"SYN3052", /* HP EliteBook 840 G4 */
 	"SYN3221", /* HP 15-ay000 */
-- 
2.37.2

