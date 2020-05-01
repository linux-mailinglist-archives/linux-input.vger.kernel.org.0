Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046261C0BA7
	for <lists+linux-input@lfdr.de>; Fri,  1 May 2020 03:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgEABXW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Apr 2020 21:23:22 -0400
Received: from mail-eopbgr700058.outbound.protection.outlook.com ([40.107.70.58]:45809
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727114AbgEABXW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Apr 2020 21:23:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NK7sc8Hf5csUyNlt0R509LZiDcPi2Vq030KCZZ6Uvo+e5LFtSqFUbx0AKJE+34nO05f624T6ElJ2nlBOZjbyNGSgKAqR1WK8PZO926izaSfR/ujmhCyY7B2ObSfIxymNp/g5C1FxWqSFgl/jhsSNt3Hav/8dSiZEHGySPmZoD/5A+gGn9bNL+BsKCiAt/sTDH3V1k2jTnqWrypQoTTpD22H5DCIn18l30C0O4xDD8mB3z/N+EvCpESKsazzp/YmxMt1jDrlRnNun8BjYtwSqhKVuoL4/Roocju7te57hOdISYtn5RMs3IOTFGR8DLggXssrJfTgboKwVe0678w0F2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtqkLDauWk0N8gduwtWnaNp90UGpGqFy740d6jnoXIs=;
 b=Wu9P6NfEPw4awWIxwTx9L9hts8vVR/fe5bw+/wVafiD+OPtvWrt3KwGcnh8xZwgyvvx6923kzpvhaCfvEwoaAtJdSTxR6602tqi7IbKhgg98l7c6E0aurd6dFq0aJB8StCX306jeXjMtDIPYeTZ3tX9u7uRTECmohr7wd5ypslvGdMmgk6pHsbyn4agnxABC+tVAQgozl2joCeXRGn5IvKiv3l9JXa/ZNntGIQeCQjniv8VD3M6zxBdpCcQR1z9emIQY+TevQCvNF5kvu5MFxp16cmbePGSqENk2taTeCSGHAAIr6WsaIA/BSC3yaIccA1PMm740KVlG2sAzLWyL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtqkLDauWk0N8gduwtWnaNp90UGpGqFy740d6jnoXIs=;
 b=RNegIEpdPiF5UXC1ezNWiTIeMc04ccFG1yOCrwtGDABqjxA5ZrwyWMpsd8EJf9REQoIT15QEbOXZlVUyC9Awy2xV6X4iVc63VEyB4luelyJ7MG4dkuCVZDAG8ywQJD5M9zBxw1MwOKFS3vuhVY0Tcf0vZB36tQ3hy1rnCEvY+fw=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5680.namprd08.prod.outlook.com (2603:10b6:805:101::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 01:23:18 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d1f2:9197:cd6:4823%7]) with mapi id 15.20.2937.023; Fri, 1 May 2020
 01:23:18 +0000
Date:   Thu, 30 Apr 2020 20:23:13 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS269A
Message-ID: <20200501012313.GA14243@labundy.com>
References: <1587340068-2818-1-git-send-email-jeff@labundy.com>
 <20200430151108.GA21911@bogus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430151108.GA21911@bogus>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: SN4PR0701CA0029.namprd07.prod.outlook.com
 (2603:10b6:803:2d::14) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by SN4PR0701CA0029.namprd07.prod.outlook.com (2603:10b6:803:2d::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Fri, 1 May 2020 01:23:17 +0000
X-Originating-IP: [136.49.227.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86640114-e846-4bc3-4f66-08d7ed6e3a88
X-MS-TrafficTypeDiagnostic: SN6PR08MB5680:
X-Microsoft-Antispam-PRVS: <SN6PR08MB56803AED1E20F1DA4D0132DAD3AB0@SN6PR08MB5680.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0390DB4BDA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jHpPeptXmXmjGxKjvqDxPXUB7aucwIWF9Rq4woq1uAfL90gEwIUEo2oYHp+XHkqzba9urI4sqze7/dL6o0sC4t3JV68MM+FZcTDo0sWmZm/B2sb9+MIW36keaL308MUAHH12LtyP0DplYwWj5w3ZRfnGfUOgTQiPHJ7ol03djQBz9ntc4WbQeit/Ewhmc7bpIIpSkc3mBneCfbkLkRbc3HVXXGdASfZENPgBhtaPNVyeJFd6KKD2lI0n/Z36TM955RJ9Jee1WtsMcTCScs2GxQpJSCCsJtBI5Zugx6A5tsu3wynXPltJByymCEjQqLI5FRd6WovDeZ8vtEIkCEAYBrRvOvRXGBMxDGoR2nC9nRdQAUeJGvrRm1fV5Sn+rinVX0WUTo1Q66xhmfmXb+yuk05+eFOH8DGT1aHncNyqk5/7WqnWzBM2NHUhDNTOdRfW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39830400003)(136003)(346002)(366004)(376002)(1076003)(2906002)(26005)(6916009)(4326008)(5660300002)(36756003)(7696005)(66946007)(16526019)(52116002)(186003)(8936002)(66476007)(6666004)(8676002)(66556008)(2616005)(956004)(8886007)(86362001)(316002)(33656002)(55016002)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 2qE8+rmbVW+gGQgUiysEv15KZZ276aQd6C8gWvN+9tC+rsnv3DuXnikfGPfk0BwKn1DDh0MRwXmR5oiNZYsTuIylzzVdciXlw5PwMs6LA+xXuvjsagB2IFqOZNeEZjAm32FwwmMEEirUMLyLrEb3hTq9pmkq0bjJYv5CrgC6HKn+NrVZwvY+/grHVDOxO3hbPAvmrzDq3bc/GVsqS31zsfhzUy3SsFNIvTcZ1jv/M608cNwX84qouA6B1vgD35gqgGsROM4eddKscxEgiM+oabBubNqLdLhzXItgK6Y+g1Btlxnpfdh0fTHa9eGf6kJ5ht9rfxSeJFWI3fE7NI+wvgkZ2yZXrr/ga0ejmKGufXCfuwYVqCt9UnwqE1jiH+6UM4i9DqMt9ne4rOMqxm81Dp3G/C8QN3fgToFu8Sc/YFaCSSpAWZC+YBckNTqShgCBsWSsd6WeQtUTBIW5P+kJX0pkzvbnnuHJdPm7lsPbodUBX9+RImtKPl61nv2RY0YcXWMxoMRyvjshBotQqGskdoEqDYy9wxRpQMIz/Ifn0W3xOQAQ1Qd4zHrFfSY4VzmZb/EKF/7YhfqSPbNM51yQlm+PEooQDsdDeHMUJmy0B6oKUXb6tMoO5NDttuMe9arHq+SIIjYHE+vhhI93/GRsINMTD2xvCmmLOQ69N1KQuPICUN/uNKnXpbZKuIGYuym3iKQ4iCN8lcOD1hW6chq8hmSAv6y1kkA009Xcu9/QvvM8Qg9rAYF38OLQxIryLzksOoYVdVCjF8kP+b0EFdiY0wFXs6jujJ9Tcs1OjtseJV0=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86640114-e846-4bc3-4f66-08d7ed6e3a88
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2020 01:23:18.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTH0p76aloWsbC8es0Lkj82SJ6ti1UonOPwZSKv7qSrmaLAMrmxvnspNLfeJigwI0BEflSL9dAgzvnnp0Htd0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5680
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

Thank you for your thorough review.

On Thu, Apr 30, 2020 at 10:11:08AM -0500, Rob Herring wrote:
> On Sun, Apr 19, 2020 at 06:47:47PM -0500, Jeff LaBundy wrote:
> > This patch adds device tree bindings for the Azoteq IQS269A
> > capacitive touch controller.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  .../devicetree/bindings/input/iqs269a.yaml         | 591 +++++++++++++++++++++
> >  1 file changed, 591 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/iqs269a.yaml
> 
> Kind of a lot of properties compared to other devices. Why so many? That 
> said, nothing looks to be obviously something that doesn't belong in DT.

I don't disagree; this device simply has a lot of knobs for accommodating
multiple sensing modes across different applications. Once I added support
for the ones I expected to be most commonly used, however, I didn't see a
reason to exclude the remaining minority and risk having to add something
later.

> 
> No interdependencies between properties? If there are, use 
> 'dependencies'.

Strictly speaking, no; each property can be specified independently of any
other property and the device's registers will be updated accordingly.

That being said, a couple of properties do impose restrictions on others
within specific channels for certain applications. It wasn't clear if/how
'dependencies' could describe these conditional relationships, so I opted
to include a note in the descriptions where applicable.

[...]

> > +
> > +  azoteq,rate-np-ms:
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> With a unit suffix, you can drop the type $ref.

Sure thing, thank you for catching these. Once I remove $ref in these cases,
is an 'allOf' still required above the remaining minimum/maximum/etc.?

> 
> > +      - minimum: 0
> > +        maximum: 255
> > +        default: 16
> > +    description: Specifies the report rate (in ms) during normal-power mode.
> > +

On a related note, should all items under an 'allOf' be preceded by a hyphen?

Kind regards,
Jeff LaBundy
