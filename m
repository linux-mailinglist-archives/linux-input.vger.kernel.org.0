Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5DD654D0AF
	for <lists+linux-input@lfdr.de>; Wed, 15 Jun 2022 20:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238101AbiFOSJk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jun 2022 14:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbiFOSJj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jun 2022 14:09:39 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2040.outbound.protection.outlook.com [40.92.40.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF453D1F2;
        Wed, 15 Jun 2022 11:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIDvw5UVStqAdSL1cxyV4xGgAJevHHBIgKGQNNQnXDT2Zanu1pGOCnEbQqMxncMVZHugitE4JCzj+Z5hg9Ad6tFaGYEZGGLhhEx4sp7akHYv5tHH3AFHy36qr9dW5Gvpir9Mb8a+mV0ULJ0T932RXXzWnpkWEE3JqekjI98DHjGIhJMGZpVIK9b3TBHZtdCbLcXHLONZqZoykU3iNiESREb7DrgfhSniCim6EpXqMjOFl5CGF1IaRvOGmtYywFkcR7sTZ0hsX2voXG2t5uexrceJIoIDJftM9wE/0j4s1BgJQkioLLkQIKkY3oq3lU5Smy3OYQCixw2mZwGWmp+cYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGDf6e5WvTqmtEA+jY2EAZvZzlyK3LgCcKVXLqJwufc=;
 b=QCmMfudwHI+QgP6I1r4M61LqmnM9D5hJUH1HQD53e2lqMh29S9x+8PxGq+0fGsfP7a99Mt1oNE+LIq7DHMJNZH7v1gA21m3IA535rm/kTQak5S+IxxqeaAU+agG0cXnNXr7v9Nver/n0s/RVGEdvH9TbuRhWt7/wAefjKJS3IeTS2iohndFye/g3wLvEMqCCMaOBmlzcxY5Isg2QHxI3P2BJMqObB/Kl0XjFeFdgHTYncHOyiFWMJx6PpLEWB7MbCAScaX+FwRGur8fmgI2r6KzFoyX2scbKz43eOWdVGTDZcVBi1SNR8N252g98/Evzp9qDG0vwbJQF9aMEIvDUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGDf6e5WvTqmtEA+jY2EAZvZzlyK3LgCcKVXLqJwufc=;
 b=GFjCvSDbTN4txkIykz+tAzrb5dHzLvi4Yl6AUokH2RWcB6o5b9yds2WfC0W4ipBFekOFCPqywatDRzrDUSgpIAxUxP4K4aKLbZPx2aCTjRsWg+nBsGfZ+TW9vsdXrR7sFIdmG2qV/ONX4H35f0KOSrFE71tUijRn8GwXigUQs6ZWRC6P1iJnqItn54bZslb42N4hIBzhgOrc1yhdmC5HR4iapBtKCO/Z3M+MPvTNhJIGbK2/jIA8EWh9eoMRZkxWQN/q5rgZ5iq1317jkz78Z0mqApXic00vI751ickN8hzpt4Ine0F7Hq4oy8lfaQdEiPwXVpRNJO/tXU8WrskUmg==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by BY3PR06MB8132.namprd06.prod.outlook.com (2603:10b6:a03:3cb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 18:09:35 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c0e4:f1d:b373:4360]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c0e4:f1d:b373:4360%7]) with mapi id 15.20.5332.020; Wed, 15 Jun 2022
 18:09:35 +0000
Date:   Wed, 15 Jun 2022 13:09:32 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Artur Rojek <contact@artur-rojek.eu>,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        maccraft123mc@gmail.com, heiko@sntech.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com
Subject: Re: [PATCH v3 1/3] dt-bindings: adc-joystick: add
 adc-joystick,no-hardware-trigger
Message-ID: <SN6PR06MB5342F18AB70B593DDE3E17D8A5AD9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220613192353.696-1-macroalpha82@gmail.com>
 <20220613192353.696-2-macroalpha82@gmail.com>
 <a1deee0f1c8293b41f47ce2c6e988fd4@artur-rojek.eu>
 <450937fd-8067-21c3-344e-18769257ee10@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <450937fd-8067-21c3-344e-18769257ee10@linaro.org>
X-TMN:  [H51mmyJbN5SKnj0yp5f4Nwt0JhMaAOO4]
X-ClientProxiedBy: DM3PR12CA0118.namprd12.prod.outlook.com
 (2603:10b6:0:51::14) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220615180932.GA21304@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bfb16c6-8121-4cde-fa83-08da4efa3444
X-MS-TrafficTypeDiagnostic: BY3PR06MB8132:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hKCGnbx+jcyYFtuDvffeaYOeejEOUzGT5GCeSvR+IVSjG2Uggo9IF/hY37sv6NdsUe8+XD2YnxJONoN4nAgRNwmOcfCcXGs8mGDsOdbfVZuHS1ohVcFD/ojnWuWO5t2Jh4r5cNzYoxHImGDxDSFMt+/yFvgVdMND3NiJNsZ7dZ+Yj4H3SEseG+yPUdZOUeYwn/44QWi5Tt/sfcYgiI2MUnfmmhJHlaOcOKDiK+tZZxyVB74ZhKBLIwrNnyNCPLnOT3fo/mxNjQSWro9GP3mqIpECzQ9YOx3D8URM6SnqE4lBTrXnL3V6pJgfi67qwXlvA3q87cvVqHKMQXyU+UxFkcYNg2XAfLWiZehqAYqhREI4rzJRi7tZSlo+6QDk0AZWGs3Xhpxl4Y/cb+UxBn8USEwpvHI19+0fZHBmNiwHip23Jiu3XTIOCUtebmkuoDquQUKJ0X20Rgl1MCTr5XHslFbwjiCYQcyU2n6TIuwGIImPiVjc9DYH43Smmj4SZevu4jlc3vgOFON9CrHrQS18puQf7MtWLsEGgVfk5YouoMnofXTUKIeuDj5B4AVtGucQ5w8e6yh48WtDL8AJcyDtSw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKeRDigVJRAJ4BDeb11hWDOAA4DhVjLafGr5Udi96nq87Cx/hTLaOsD0DiAh?=
 =?us-ascii?Q?rhZpVBWFktqfTHEA2eGvSckfw2H7gn3jqiLNYnYSMKKA02flHBWnzhBZHsct?=
 =?us-ascii?Q?R9mqtxuWX79ii1uRn42plvq9l801vATbmFgQ64uWWSYc6L8HJsPG51KSlJbK?=
 =?us-ascii?Q?zP0Kt2r8yB5t7oNTbIWUKoH1MrgiWlUkwtPLtsELPurVnEhCbFhtrV436iCG?=
 =?us-ascii?Q?F8mYMJT1u229sCNkw284FuLiq5KE2e1Ac/6KuLUC98zOM5TuRY1weQv29gNI?=
 =?us-ascii?Q?r/pmwtIVIkWN4klXv13FVjltEQY4DL6aDvJwBEEi9bnzSqk0htGxNS2ste2y?=
 =?us-ascii?Q?7bVDe15lkBCbwHWMNuXfI/0NOV4NbAGv5xreC8SfUnAOywuP3lkVPg/atCS8?=
 =?us-ascii?Q?4TWZuYr9IfJYPvXwNGJhrN1CcLykOJ2jSQmmR9GGbYH5txY2CRowR8NPtFWR?=
 =?us-ascii?Q?RKdF72GyDgsAaOfIbTS3F0KS3xeG98GnT1qWyz+a4ZDkeCslgeOKb7YSeHWb?=
 =?us-ascii?Q?c3Ck9kiyxQhYtoiCDxUkBVXexUZZ7N/Tq5jjYA/qSyzqmykAPVxJC6+65PLL?=
 =?us-ascii?Q?6kv6D7x9pFVqWBBTmdfQWIBp+RH0GnKauoRGgHPEBvvHDbM8vYxpnXtucsmE?=
 =?us-ascii?Q?6edy/P+V9wQ2Uea3uOShfTeO3Q5jRMaO6qZ6elMqcxLGrT/4lii4GV6BUPwZ?=
 =?us-ascii?Q?QUEeS4tYvCYQrnaHIiX5iCIKI9KMaxrhe4IjX3vOlhF75Fgw9hrEUebG6T0b?=
 =?us-ascii?Q?HjXlMtGXFsat62xiLgB9TTS/tTzgQXghuA5OEDVGs3LwrNc2u1BTOngm5G1v?=
 =?us-ascii?Q?z8yLO9kZaPx2Cx235AtzmLisZ6niWVP+zRJaeskQ+yM2Qd29crtPWqbyLv//?=
 =?us-ascii?Q?7tAop/KbVTsgIhWA2WEkvz7sYCBsTdAggl2c9mFykrtMyOSl57Y1MTEO58Ru?=
 =?us-ascii?Q?5r+mYtwQ2qjlsr0FpIhQRoLewZ5RwFA22wu7gWO3yRMQ+eQq74dNQeCn7sOv?=
 =?us-ascii?Q?d5/OUnZ52B/JQ1Pq/3Oj1DxXP+uxFkDl2IyaTu8s/kjTw9qiN9k1nfPjUw25?=
 =?us-ascii?Q?qZWIiL2olMzp01iFdiceqK13FlgI3umBtG1aQRkdrwKjX80RiXBPG0H7BxPg?=
 =?us-ascii?Q?8Xx3kKpCSCg4wLyWNgPxqoGCMl2hMG30AXMokMFl7MBYetwBKzZhtDKKuiRn?=
 =?us-ascii?Q?HL8+PrWcpBFfdZfVB2J1MZvEqkCANv3yE/lFOupY1fya+LK7I7wgPssgj4tv?=
 =?us-ascii?Q?S4SriGWPWbjDp93B00dZHm2J3DHx1ffaME+OlJn3td+zrLsCQVUGTdiQjprm?=
 =?us-ascii?Q?zISNEtbhu31dX7mC0PyD9KCSJSn/j4GAghFOe57oQpSI20YLdry2q7BPj82Q?=
 =?us-ascii?Q?Xfv+7F2XRiLPu+G/djdl8tWxbP4hbfIYb2iHdjie15yjuWH5slOCqYR8JSmd?=
 =?us-ascii?Q?axsu1F9VNzk=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfb16c6-8121-4cde-fa83-08da4efa3444
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 18:09:35.7697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR06MB8132
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 15, 2022 at 10:23:55AM -0700, Krzysztof Kozlowski wrote:
> On 14/06/2022 18:50, Artur Rojek wrote:
> > On 2022-06-13 21:23, Chris Morgan wrote:
> >> From: Chris Morgan <macromorgan@hotmail.com>
> >>
> >> Add documentation for adc-joystick,no-hardware-trigger. New device-tree
> >> properties have been added.
> >>
> >> - adc-joystick,no-hardware-trigger: A boolean value noting the joystick
> >> 				    device should be polled rather than
> >> 				    use a triggered buffer.
> >>
> >> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> >> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> >> ---
> >>  .../devicetree/bindings/input/adc-joystick.yaml          | 9 ++++++++-
> >>  1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> >> b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> >> index 2ee04e03bc22..627cc6c40191 100644
> >> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> >> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> >> @@ -12,12 +12,19 @@ maintainers:
> >>
> >>  description: >
> >>    Bindings for joystick devices connected to ADC controllers 
> >> supporting
> >> -  the Industrial I/O subsystem.
> >> +  the Industrial I/O subsystem. Supports both polled devices where no
> >> +  iio trigger is available and non-polled devices which are triggered
> >> +  by iio.
> >>
> >>  properties:
> >>    compatible:
> >>      const: adc-joystick
> >>
> >> +  adc-joystick,no-hardware-trigger:
> > I'm against using Device Tree for this functionality. See my reply to 
> > patch 2/3 for details.
> 
> I am surprised to see v3 after that comment...

No, I'm sorry I must have missed this comment or glossed over it when
updating a v3. I've tested checking for INDIO_ALL_BUFFER_MODES and that
doesn't seem to trigger the desired behavior (since I think maybe
something in my kernel config is adding INDIO_BUFFER_TRIGGERED, and I'd
hate for behavior to be dependent on what's in the config versus what's
in the hardware). Would it be sufficient to check for
"(INDIO_BUFFER_HARDWARE | INDIO_BUFFER_SOFTWARE)"?

Thank you.

> 
> > But in case we do end up going DT way, I would much prefer going with 
> > Rob's suggestion of using the existing `poll-interval` input property.
> 
> +1 here as well, if above does not work.
> 
> 
> Best regards,
> Krzysztof
