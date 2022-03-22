Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864A14E4301
	for <lists+linux-input@lfdr.de>; Tue, 22 Mar 2022 16:30:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235827AbiCVPbo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Mar 2022 11:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235839AbiCVPbn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Mar 2022 11:31:43 -0400
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40048.outbound.protection.outlook.com [40.107.4.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390E08BF08
        for <linux-input@vger.kernel.org>; Tue, 22 Mar 2022 08:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1zd97B0vn5GX48xNmHo53LJRv/rdVph5UeDoxIIwjX5HN7TM/im8/t7p6kRBpjwIoH6YSiw47RSsMUD6Hnjh30Exlmaqy7JDWTK12x2uSPBkrlUkjTgbMLafXj1MAe9HsOoim5iCO1haFZsixsSCavM+nGqPNx9D9ERRNdXIxs1V/tLPUnSjjjlPCskMxECLNlYHT6w3+CkJqhCRD20U/+nUF1wyQ7PRNGipgmcShcq2gx/wVprsDZYhjbR9h4PFJoQa120Qy6rDrHYbHZsB0aLIX/f6cntQr5FUHswX6uWuyHx9y1ZjiNn1M3X2rHwLvPl7PLRhG4gPE4JDXI0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czDSdExrZrtDaiETJRxQaVsmFg+Wg3g+YqQLitDnqwY=;
 b=aYAmWxCbE5Cwv9+ByzDvMCXLtxr1tqQ/BKuW+x5T9Y4XMRb+piWD4yVvAiVwnewxmRLQj3CBaBSF+CdbmYf5IIykzHMBaMDcYyJ0R+JhT/rGcfw8EEH+2zRocPCJIE+5BvX3yNLZ1ohHJQwwnavNdlIzHGvr03XtodnGC38LKlekVM1B9YU7IBSx6wyKvdh/hczGFeW8xf+uku23XKQZtqvwVWtMvYjRvwWGF7cGRsj1xj37j3yObuWj8Ax6KJqbjio1p65VxWtgLAvK1FOXp6oXL2jIQgUMug6aw8K80vf6xJgU6LLn0zMDgWeZO84YAQmShp280lVXNdxoROOwyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mec.at; dmarc=pass action=none header.from=mec.at; dkim=pass
 header.d=mec.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mecat.onmicrosoft.com;
 s=selector2-mecat-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czDSdExrZrtDaiETJRxQaVsmFg+Wg3g+YqQLitDnqwY=;
 b=FTMc8CnUq7YgsKFhpAgZjfcEuosrNvCl0VG8OAJL13HAvgOVPfr69ZqTlX4P5Su028HGApyuTJmHUuCJ7ffdsJUNDyyeUjkFQVbmK3D6xzuKoMH/uMjnp227TLqRzLztqlQiKjEIjptszbOYtX6cUSovOARtP0aP1rR6FJaMXFA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mec.at;
Received: from AS8PR03MB7079.eurprd03.prod.outlook.com (2603:10a6:20b:291::8)
 by AM5PR0301MB2563.eurprd03.prod.outlook.com (2603:10a6:203:9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Tue, 22 Mar
 2022 15:30:11 +0000
Received: from AS8PR03MB7079.eurprd03.prod.outlook.com
 ([fe80::7c84:b985:d732:6299]) by AS8PR03MB7079.eurprd03.prod.outlook.com
 ([fe80::7c84:b985:d732:6299%9]) with mapi id 15.20.5081.022; Tue, 22 Mar 2022
 15:30:11 +0000
Message-ID: <0fd28c6d-eb5c-0af4-e193-bf6cfbb5ff99@mec.at>
Date:   Tue, 22 Mar 2022 16:30:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   Thomas Marangoni <thomas.marangoni@mec.at>
Subject: touchscreen: sun4i-ts: startup/configuration problem
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To AS8PR03MB7079.eurprd03.prod.outlook.com
 (2603:10a6:20b:291::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6029b68f-53de-4673-1d4f-08da0c18da74
X-MS-TrafficTypeDiagnostic: AM5PR0301MB2563:EE_
X-Microsoft-Antispam-PRVS: <AM5PR0301MB25638F233EAE4DD7C3ED18C6F6179@AM5PR0301MB2563.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6yB3L0JfO+joIjxrqUjiVVEd3DI5yWtryUoGOtfiern8XvbenMngarKmnlgxsbhO+LsRGKJN9xaK3zYwNF64/vnQgpZRuZXaTzpcpj3rfKInxVvuoKqipshBPzeiSgYpkmPrrMJojoAyM6njX6PuiEMg6BZQOK6VUuJbt3Nfeeaz2GLi1BwTM7tZuoI0VSE8uy8j2q+PVCxXmBeXaLpDApXBOoPC1PPzrLFQG4a46pOVCz+LCBMEu2NnYFCV2w8Ie7d7Q33MFp231NEIbY9ngNiIjrbuZOQy+Qm+wtnu0ONIC8iumVA87gBW1ORqFzfnI0KySaYu6tiZqvzFuE5duIdIz2lJb5pePu8bNTDcPj48sf28XbN4M2lWrQYM0GYMuJG/fPOGAUX+txab++HkRzHwqU46vkgrBSb8xvHqgjlmiCH+sqqD1GtJ6xFdnECvhPbcmiweLp3JKdXENTP7TJA2WuVwfIRNAf0N0ECVvUjIR41FL9JPKVeb8+mn4lqlQJEAvLMxCiXizvsbuK8h0WVZu9woN4zXJ/PdM5tLip0abzhTeX8sQusZd5KFVf9yhbra7fStJRNX+QTo/72eN4twm0Ql036F/31JqUe7PI0haLZC9HIRHcUZ3OPRCL1IOft4NsJG0Zix77ZW8/zxs2elHWTmj+gCjiCD9ygZ2m1siJ8AlAaT11Q+GeNGWhBH1mB+h5feepV4/gy/aOcvfbpkBvPEKsgM2vYMwnrvnH8Ue7MntrVSXo7Dz/Jg2K+3qU85RX/wgKngSySeN5FXdw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB7079.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(346002)(39830400003)(366004)(396003)(136003)(376002)(66476007)(66556008)(66946007)(86362001)(8676002)(508600001)(6486002)(31686004)(44832011)(6916009)(2906002)(5660300002)(31696002)(36756003)(83380400001)(55236004)(52116002)(6512007)(2616005)(316002)(6506007)(26005)(38350700002)(38100700002)(8936002)(186003)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZCaVZUUFJSakhZcGtxTklPTUVHaWFubmh3MVBueG9rYm0ySk1uVjRtVk5F?=
 =?utf-8?B?ejhtOWJGRG8xWjN2c3NXd1U0cXJCNDg2dFU3dWwvVUh0WGttWkxUS2NUbkl4?=
 =?utf-8?B?TEJwYlJqeEZ6YlQyUDBOei8wKy90U0dnZXk3ekdydlZheTNtMnZ2N2ZFU1hT?=
 =?utf-8?B?d0Y1cEk2b2RJcFBLRlNIVTNMS01ZUnM1aUpjdmNDdlBLY2cyQXlmTk5EQ0ZD?=
 =?utf-8?B?R0VldlNVVGd5MHAvTUcxM1ZmMXYwK0diVVNzcnZzRnZ5dFBwaWlSenVYZzdD?=
 =?utf-8?B?cmtWdExqb3VPVFpLcEt1RkdkMFBXV2g1emR4bkF0T1VOaDQwdTdLejYwdjBn?=
 =?utf-8?B?UXp1Qm80SDRQYy80NEtVaFQxRGJJMk8wRkNHbStpdSt4SXVJbnZMS1hMVHcr?=
 =?utf-8?B?WnlzMFpCbGliVUFQVG5BUVQxT3NtMDZ4dSt0NkluNGNZUFBRWXh0N3FuU3Vr?=
 =?utf-8?B?dGlNL1ZQVGd5RUdZWmFJdHh6MVNQdVFFWlA1Yyt0NVZDSGtlVFlaOGN1YWQz?=
 =?utf-8?B?VWJCbUlrSW9SbEdkZlFjYjFKS1NNem5uNVhmVDg0RTNmZFlvQ0pwRVd3bDV2?=
 =?utf-8?B?dmtDQWJZWGo5M1BXZDNReit3anR3SFRoMnJxcDhKRng4RU8xMU1jako5bGNq?=
 =?utf-8?B?bWNGR2FmWkFVR2ptckJINW1Ja1lZSkFqRXgvanJxWmdTeHRPditvWlA2TEZx?=
 =?utf-8?B?MkR0VW8zWmRhTXptUEg0cXp1a2kxRTZMcGg5dzJVTXp2dSs2Y2dITEtuN1pI?=
 =?utf-8?B?ZmdhL2Fuc2NzMDhEbUxtU0YzcThPWU0zd0R5cTRpVWF5Y3FOdlh2aHllY2xV?=
 =?utf-8?B?T0I0SmVZd1MvbXhRRlpWNlJuMTA1OWhPaE5nUUNPZ3NFM0RGYXFsVDlNRjBh?=
 =?utf-8?B?RlVSZk9rT3AzMHRLL2dOMitTcW9VU3AzMTVpTy9xUDM0QUpVSUVDT2tsUEZk?=
 =?utf-8?B?cUM0K3NrUzFSRzFTbkVLMzM5UTRLRzMxUVBtUjRMRnVEY2YxUWFycEkzMDFG?=
 =?utf-8?B?WUJJa1lYZGM0UlJkTGIyT1d4OVpSUXJES3ZXQVZ0b0FqcUw3WEdlY0h2czhK?=
 =?utf-8?B?dGNXaUpWNEJXSW9WdlcvRVh5QVpkRFVRMEtTRFdPTko2U3hXa3JQOTNkSXAv?=
 =?utf-8?B?MEtPR3hGTktFRmh0dVExUXhIb09ENDdCNmxpaUpwZlFzVVlIdkV6R1FNV1lo?=
 =?utf-8?B?aSt1YlNRbVJzclg3Yk8zVVRtZTdEQUU1S1djZ1o5Z0hRWmgzTHV0bEp4czdI?=
 =?utf-8?B?WHEwZWNhQjFmbVFxWnFyYVZhZUNOdTh4cVA3dExMN1g3d1lmSkZCanN0WTMz?=
 =?utf-8?B?UXJyc0R1K0tCSjJMb0JiUGtDci9FeHZMM1RDMTlyZWV2UkRxR0gza21NT0Y1?=
 =?utf-8?B?NVpvWWVqZjVIczlqVUsvcENONDAzZThiMHJwb1JCUHd3SkR6YW5CUEFLMDl1?=
 =?utf-8?B?cjRxVlpSMGNyNjJzWG1FQTBLeHk0SGk5RHVuVU5JUDdNYmpWa2ZXWFdKS3ZS?=
 =?utf-8?B?a1paTnVaVkZPTmJmMVdiaUVUeVowOXpMUHJTTjFqdmNtT2xBZE5FWUh1NUE2?=
 =?utf-8?B?YWhPYlQ3WnJGQ1NTYVhoeGxna2pWU1JTYUpydkpiOVBRZ0FtdXRSd2NrSzR4?=
 =?utf-8?B?V1BUMUladmJ1VHZLak1GSGdJVGpORXNJN09DVE41UzZOOC9pSHpORWM0cEF4?=
 =?utf-8?B?TzJDemtITnNvWjFxMEQ0YVVhVFA1Mm5qTTZjTnFqdndLUGV3OXhPVFlITUpT?=
 =?utf-8?B?SDlSVThSY2dhUEVZT1BsUXRtZDBhbytnOWVRaGRrRlpXbUIvMm9VSlJsNURW?=
 =?utf-8?B?OHRGS2lzWVJPYUlOY3k5L1RoelJXQ0hTS3Z0cFZka0FoM2F6YkZVYlY0dXlF?=
 =?utf-8?B?ejQxd3N6MEVxdjQvSGxXL1F3RmtiTm9STFBxVFd1bnZEakJyUkt1NjV1NXB2?=
 =?utf-8?B?M3I2czNQcjhMUGtiTnY1M2JaZkVIYmw2bXBzQnkzSkx4OGVjNFpEUjN4ZlQw?=
 =?utf-8?B?NlZCcXBteWZnPT0=?=
X-OriginatorOrg: mec.at
X-MS-Exchange-CrossTenant-Network-Message-Id: 6029b68f-53de-4673-1d4f-08da0c18da74
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB7079.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 15:30:11.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0f47e334-58db-4591-b50f-1937a70d1a07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5nvwFWhhfSV81YR+tvYI59dfsEvlQzDGs2rjCnSyjPVoPngxpEFD2Z+yP0YwDgGb+dhLI5XvbqKm4JwBCYsSsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0301MB2563
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,
I'm currently trying to get the sun4i-ts working for the allwinner f1c200s. I already checked the registers are the same and I have adjusted the offset in the device tree. I added debug output to the driver to see, where it gets stuck.

The result is that "thermal = devm_thermal_zone_of_sensor_register(ts->dev, 0, ts, &sun4i_ts_tz_ops);" is returning "-EPROBE_DEFER"..

It is probably an configuration error on my side, the device tree will be attached at the end. I would be glad if someone could help me.

Thanks,
Thomas

> /dts-v1/;
> #include "suniv-f1c100s.dtsi"
> #include <dt-bindings/gpio/gpio.h>
> #include <dt-bindings/input/input.h>
> #include <dt-bindings/thermal/thermal.h>
> #include <dt-bindings/interrupt-controller/irq.h>
> #include "sunxi-common-regulators.dtsi"
>
> / {
>     model = "MC4L";
>     compatible = "mec,mec-mc4l", "allwinner,suniv-f1c100s";
>
>     aliases {
>         serial0 = &uart0;
>         spi0 = &spi0;
>     };
>
>     chosen {
>         stdout-path = "serial0:115200n8";
>     };
>
>     cpus {
>         cpu: cpu {
>             compatible = "arm,arm926ej-s";
>             device_type = "cpu";
>         };
>     };
>
>     thermal-zones {
>         cpu-thermal: cpu-thermal {
>             /* milliseconds */
>             polling-delay-passive = <250>;
>             polling-delay = <1000>;
>             thermal-sensors = <&rtp>;
>
>             cooling-maps {
>                 map0 {
>                     trip = <&cpu_alert0>;
>                     cooling-device = <&cpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>                 };
>             };
>
>             trips {
>                 cpu_alert0: cpu-alert0 {
>                     /* milliCelsius */
>                     temperature = <85000>;
>                     hysteresis = <2000>;
>                     type = "passive";
>                 };
>
>                 cpu_crit: cpu-crit {
>                     /* milliCelsius */
>                     temperature = <100000>;
>                     hysteresis = <2000>;
>                     type = "critical";
>                 };
>             };
>         };
>     };
>
>     soc {
>         rtp: rtp@1c24800 {
>             compatible = "allwinner,sun4i-a10-ts";
>             reg = <0x01c24800 0x100>;
>             interrupts = <20>;
>             allwinner,ts-attached;
>             #thermal-sensor-cells = <0>;
>             pinctrl-names = "default";
>             pinctrl-0 = <&rtp_pins>;
>         };
>     };
>
>     panel: panel {
>         compatible = "qiaodian,qd43003c0-40", "simple-panel";
>         #address-cells = <1>;
>         #size-cells = <0>;
>         enable-gpios = <&pio 4 6 GPIO_ACTIVE_HIGH>;
>         power-supply = <&reg_vcc3v3>;
>
>         port@0 {
>             reg = <0>;
>             #address-cells = <1>;
>             #size-cells = <0>;
>
>             panel_input: endpoint@0 {
>                 reg = <0>;
>                 remote-endpoint = <&tcon0_out_lcd>;
>             };
>         };
>     };
>
>     reg_vcc3v3: vcc3v3 {
>         compatible = "regulator-fixed";
>         regulator-name = "vcc3v3";
>         regulator-min-microvolt = <3300000>;
>         regulator-max-microvolt = <3300000>;
>     };
> };
>
> &be0 {
>     status = "okay";
> };
>
> &de {
>     status = "okay";
> };
>
> &i2c0 {
>     pinctrl-0 = <&i2c0_pins>;
>     pinctrl-names = "default";
>     status = "okay";
> };
>
> &mmc0 {
>     vmmc-supply = <&reg_vcc3v3>;
>     bus-width = <4>;
>     broken-cd;
>     status = "okay";
> };
>
> &pio {
>     rtp_pins: rtp-pins {
>         pins = "PA0", "PA1", "PA2", "PA3";
>         function = "rtp";
>     };
> };
>
> &tcon0 {
>     pinctrl-names = "default";
>     pinctrl-0 = <&lcd_rgb666_pins>;
>     status = "okay";
> };
>
> &tcon0_out {
>     tcon0_out_lcd: endpoint@0 {
>         reg = <0>;
>         remote-endpoint = <&panel_input>;
>     };
> };
>
> &uart0 {
>     pinctrl-names = "default";
>     pinctrl-0 = <&uart0_pe_pins>;
>     status = "okay";
> };
>
> &uart1 {
>     pinctrl-names = "default";
>     status = "disabled";
> };
>
> &uart2 {
>     pinctrl-names = "default";
>     status = "disabled";
> };
>

