Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A7472D6AA
	for <lists+linux-input@lfdr.de>; Tue, 13 Jun 2023 02:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236989AbjFMA7I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jun 2023 20:59:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjFMA7H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jun 2023 20:59:07 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC28E10DF;
        Mon, 12 Jun 2023 17:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epzLUGXens/f9Ynp+sdtAMazKxykcfbvdydKAQN7XKRThNLESjOPQp6jBCx/sn2rcbNkZl9FOynbijNMf2MRc9mhRRW97rOom7aIl6SaezdKR9RKaNu2ol3+evIYWKR6mC8CwQtKl9BczqSLNGlTvT6yB7hgnBahz5eXr1d/5hL76nn0jx5I1aCht88K8qlDYnKVhj94AYzg4XuHjI5O+v4nxy0o8PmsilayV4uMilnTB/cq7A0UTctL0Dj6WFCAaOfrD2vJxLKSEuXGT2ZoD/bgk3joBsU633SRYt3kwqK4dxkLDbjT2orjJ+y8otU+62qgExNlGvLPFdMsVpLYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZOzp9HXB0AA2B9xTdrP2cMoTWThFlChj3txzohXvfg=;
 b=MN8gsF9Az0awLGVX/0RfHA1yvWjdTfh4Ya+QQkj95gT3gJ6DMjAezcEEbGitgXHtsLeGcwI4LE9SAWc/tnrZgWoFwOUrNjym+8dCwTY0oo7V4T4hdlfmZI7Vg1cqeaCS6OEh42Qfh98GODgciGQPzh7bHJHPmoMlJUl5qAQ2ZFk5teXa1kfte0wjQuNlx/yFKj9MHqXfp91vw+a/4mdg9CAu/R2rA91Nt37CgUgi5Z0LPDPvjxesOH0/0PVNdiIlx8uXN19G2VUtNexxWqAHyl4eEuCt3cmTzHKr7FcWTipBZ2ZYiXusH+8l9npizrrLoGULYvrACB75ZB/Oldvd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZOzp9HXB0AA2B9xTdrP2cMoTWThFlChj3txzohXvfg=;
 b=iGWBuwzBTb0khaMwb9oiCMdIzP90Hi0kuPrD7fHAZWzU5ABQScLSS/tr6CGR8N48B913L3PhVH9MOyc0nrRh/oqibDO/X4+Jm5qUerVD6Z3dijHh4wNiz6eyg+vj1OZBJEeP9S46Z96odxwLnpiUYek3moMqYl9nmDCkI43o/j4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CO1PR08MB6997.namprd08.prod.outlook.com
 (2603:10b6:303:d4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Tue, 13 Jun
 2023 00:59:02 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ca3a:84ac:381c:1506]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ca3a:84ac:381c:1506%4]) with mapi id 15.20.6455.043; Tue, 13 Jun 2023
 00:59:01 +0000
Date:   Mon, 12 Jun 2023 19:58:54 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <ZIe/Ti7u+2VHlahA@nixie71>
References: <ZHVD/9OgRTAwBhqx@nixie71>
 <ZHVEa0yM1LLUJEfO@nixie71>
 <20230609142538.GA878396-robh@kernel.org>
 <ZIZvkGqr4a0kOGnR@nixie71>
 <20230612152925.GA65549-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612152925.GA65549-robh@kernel.org>
X-ClientProxiedBy: DM6PR01CA0001.prod.exchangelabs.com (2603:10b6:5:296::6) To
 SN4PR0801MB3774.namprd08.prod.outlook.com (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CO1PR08MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfe263a-6053-4c36-f622-08db6ba96082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AfeShJx+wkH38GXWTLJSpM/jXHQgjMzR/2q6xm6lG27YLbFuuRIW8yHt0dWAN0/epUuhmnbVLGkAs92ilimjKjUrHtLS802Va09Rmr9abaLpKfsm+eWgkQ5SYnTFYIjNWFuf20+zXINkXcloc0dI3IW9tVyEvIQnv/1EzB2Smi0/G9uNgDqixllA3CPKyRVsr877ebKvXNtXT4e8L9HAZ4Jo1PJaJDX0raZ+U3wJoiAIP3VGmAUmVOOsY+cbp2QriThpAphok4A8yYdY2GQ6cx0Y5QU911XCd13G5HpWsx8zgtIlotQjq/lPjW9x6J6WTqW1pFqspYxiPFo3LY7UeJXY1xwdbbAzqge9GkJrFPA5Dm/zymqLrk19Snaa7f4pzw9tjRCkHy5KQ8OgCt9hip6+q5uwlAZ2H/k4qGhPiTv9jI3xf3IAAtbNydfLvt1cA6qQ24k+btjYncukLbP3Xeluu3+6H6pHV27w7flzrq65b9hDeOCHQVK2BlZE7p4ybT/epKbMi2VKkEAqpk4Fi7IazbD8wMmsHEDdw3tJDSQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(136003)(396003)(346002)(39830400003)(366004)(376002)(84040400005)(451199021)(6916009)(966005)(41300700001)(8676002)(8936002)(4326008)(66556008)(66946007)(66476007)(478600001)(316002)(38100700002)(5660300002)(186003)(83380400001)(6666004)(6486002)(26005)(6506007)(9686003)(6512007)(86362001)(33716001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5xjBU/paMsRssl6QSO7zVNXV+ZSwcCCAuQdmaljqIYC/qhV9i4OeYnhXICjo?=
 =?us-ascii?Q?091nUh0+B5+JX3glvqltgrDEeqIfSTikX7oRbC1EhG1LiSnE+xA60mAFvnSh?=
 =?us-ascii?Q?Xr5DY6HqNwr6ACmXGwOiMHAtQ4U4sFMdUFqajbA39+gM5JunZ5UeTIp39SJH?=
 =?us-ascii?Q?neLSHdOYDiqaE80Rttj8RUhGw7dZBNmB5TKz1dwZl04vQg/XyFIonHU0JD1I?=
 =?us-ascii?Q?tDv1bjpcvy/37/5yJJ1kFIZWX/+junwXvXZ9x+LIbKYB9khdtkWBX5LdUw2Z?=
 =?us-ascii?Q?rhtrCGV5mG2103PUc9hVQoPJJ29PWkgRMC8JD+jSRA4Omgt4N/4fY1IgxLhb?=
 =?us-ascii?Q?sPPAyDVdBdOd0B4IThzmUMh4zX+w2Due7abqSr3JLItoqcrO2vFEQEM6WDWV?=
 =?us-ascii?Q?FMv0KSLGQMfQky8syKmQFceokQ5as1V8npYr+jfiIWYWpdA9qZzUxXVgtUZ7?=
 =?us-ascii?Q?5hnN9ZRkoj2KyDAkC1UYLDgqEybvwmE9XE0zVQAfM3MFk1gVbc2sHo2kJyWX?=
 =?us-ascii?Q?+KNeo+wSgivKa1OMzRvyssmuj/GY3MpiLqIjP9UXQI+8rYyd8qZWi22+HnFm?=
 =?us-ascii?Q?2na/GXNbxs8UJkTgPF023CDp6gni7321uGEvFXcgFXCh2CgsF78PKp9JkvoY?=
 =?us-ascii?Q?gtyv+QUbdlbuKk6cS1b4T+M4CcGBRa3a+W3NjDot1MPgvGPy0/+0v0p+DXF7?=
 =?us-ascii?Q?sUiv9PJSMyY+K6qIwttoGkB0wlQzl2vhmxXAbkWRDIQATH1laYfPB1QYFxk6?=
 =?us-ascii?Q?6KHsntt2VLTUd4LbGD5sD0G/euBHqgB4w239Rz7D1D7O+X1knuxjXYae7IT5?=
 =?us-ascii?Q?QBn3kXIW1STEPE8Kgm9gkepw1ragmn7nE5uyHRD/BF7KELBiWW53L/+Df5gx?=
 =?us-ascii?Q?nM35+7J9TQjodg5Vnz3wEX8qV7DsJFfhsMuOeq7jQkq/OxGzNWfNw2pB+hbU?=
 =?us-ascii?Q?3bGAYu0uvDsOPryp94SoYHmVm/ZrwpljHUs6NQYLOiEZHjD3wU5/Bu5Leb6Q?=
 =?us-ascii?Q?fuH4Y56TXALIN63iuc+xFpKOzjBjnxGsuAGFt2Hwk6TMPmlenlRYW3D0IHTK?=
 =?us-ascii?Q?p4GLXz2P903SiCuYuqqw6yfrWWU2WzJONDWYOapBdxGkXxzT0Nekkw0L88Wr?=
 =?us-ascii?Q?nVt5O6fnm7kg1N/CDMYMIh577eY0QFDIVQCu3Zsd+kpp5M+Xome2WnGTXUHt?=
 =?us-ascii?Q?2AKPmKh1+QGkHwjOSWR4II66P4rGRbSeMDpwsY9qSHxyDAeDakVHdPVo6I4w?=
 =?us-ascii?Q?k6keNIEUxMjyqAlRBdH9aXAV67edtVVwLQsCaKkSKMBxKARtFOQlmYpONsUd?=
 =?us-ascii?Q?MCakTpvQphhBNNhZQVTMdVNlhYRm/vx4JkVCfnFm2c/weXu1kV/UrPwc0FVc?=
 =?us-ascii?Q?lSfwsnu494OrRw4zhrwca/invRHUlZr3xodTq0vYXDMCPLEeBtUfPA428rnz?=
 =?us-ascii?Q?XoCb5Do6iC39Ci9IadaBu+sqVRhFbDJ16vCPCpAdeTnV9WHirwKyVR1Frin+?=
 =?us-ascii?Q?w4DLijt1cMp6Xy2IIBb7l0RgZT7Acaylrn1StFcd6B7I1rkxui9mJWtb1NXs?=
 =?us-ascii?Q?0ACCzcJLtKUjuYPJp8yNNefs1anHLUweBd+PfhL8?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfe263a-6053-4c36-f622-08db6ba96082
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 00:59:01.8987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j17xnyCcPkzm+RENA1DsgknbKOP+KOgCxPfVxoBTBlKCtuOgtA4ojCagiSTN9riUD+kHd8xDZiGNhYAtMANlPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6997
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

On Mon, Jun 12, 2023 at 09:29:25AM -0600, Rob Herring wrote:
> On Sun, Jun 11, 2023 at 08:06:24PM -0500, Jeff LaBundy wrote:
> > Hi Rob,
> > 
> > On Fri, Jun 09, 2023 at 08:25:38AM -0600, Rob Herring wrote:
> > > On Mon, May 29, 2023 at 07:33:47PM -0500, Jeff LaBundy wrote:
> > > > Add bindings for the Azoteq IQS7210A/7211A/E family of trackpad/
> > > > touchscreen controllers.
> > > > 
> > > > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > > > ---
> > > > Changes in v2:
> > > >  - Renamed 'azoteq,default-comms' to 'azoteq,forced-comms-default' and redefined
> > > >    0, 1 and 2 as unspecified, 0 and 1, respectively
> > > >  - Defined ATI upon its first occurrence
> > > >  - Redefined 'azoteq,gesture-angle' in units of degrees
> > > >  - Declared 'azoteq,rx-enable' to depend upon 'azoteq,tx-enable' within the
> > > >    'trackpad' node
> > > > 
> > > > Hi Rob,
> > > > 
> > > > I attempted to reference existing properties from a common binding [1] as per
> > > > your feedback in [2], however 'make DT_CHECKER_FLAGS=-m dt_binding_check' fails
> > > > with the message 'Vendor specific properties must have a type and description
> > > > unless they have a defined, common suffix.'
> > > 
> > > Is that because you have differing constraints in each case?
> > 
> > In the failing example [2], I have started with a simple boolean that carries
> > nothing but a type and description. From the new azoteq,common.yaml:
> > 
> > properties:
> >   [...]
> > 
> >   azoteq,use-prox:
> >     type: boolean
> >     description: foo
> > 
> > And from the first consumer:
> > 
> > patternProperties:
> >   "^hall-switch-(north|south)$":
> >     type: object
> >     allOf:
> >       - $ref: input.yaml#
> >       - $ref: azoteq,common.yaml#
> >     description: bar
> > 
> >     properties:
> >       linux,code: true
> >       azoteq,use-prox: true
> > 
> > However, the tooling presents the following:
> > 
> >   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> > /home/jlabundy/work/linux/Documentation/devicetree/bindings/input/iqs62x-keys.yaml: patternProperties:^hall-switch-(north|south)$:properties:azoteq,use-prox: True is not of type 'object'
> > 	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
> > 	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> > 
> > [...]
> > 
> > I am committed to addressing your feedback; to help me do so, can you help me
> > identify what I've done wrong, and/or point me to an example that successfully
> > passes dt_binding_check?
> 
> You're not doing anything wrong. There's 2 options here. The first is we 
> could just relax the check to allow boolean schema for vendor 
> properties. The main issue with that is we then have to look for that 
> improperly used and it doesn't help if you do have additional 
> constraints to add on top of the common definition. The former can 
> mostly be addressed by checking there is a type associated with the 
> property. I'm going to look into adding that.

Thank you for your feedback. I started with a boolean property at first to
simply test the idea before moving too far forward. In reality however, the
common binding has many uint32's and uint32-arrays as well, often with
different constraints among consumers. For this option to be effective, it
would need to be extended to all types IMO.

> 
> Alternatively, you could drop listing the properties and 
> use 'unevaluatedProperties'. That's not quite equal to what you have. 
> Presumably, you have 'additionalProperties' in this case, so listing 
> them serves the purpose of defining what subset of properties each node 
> uses from the referenced schema. We frequently don't worry if there are 
> common properties not used by a specific schema. This also wouldn't work 
> if you have additional constraints to add.

Because of varying constraints among each consumer, I do not believe this
option is viable either.

I also think adopting 'unevaluatedProperties' here would be confusing from
a customer perspective in this case. The new common binding has dozens of
properties for which some are shared between devices A and B but not C, or
devices B and C but not A.

Without each device's binding explicitly opting in for supported properties,
it's difficult for customers to know what is supported for a given device.
These particular devices are highly configurable yet void of nonvolatile
memory, so there is simply no way around having so many properties. Most are
touched in some way throughout various downstream applications.

Therefore I'd like to propose option (3), which is to move forward with patch
[1/2] as-is and decouple the merging of this driver from future enhancements
to the tooling. While patch [1/2] is admittedly a big binding with some repeat
descriptions, none of the duplicate properties introduce a conflicting type.

If in the future option (1) can support all property types and handle varying
constraints among consumers, I would be happy to be one of the first guinea
pigs. Does this path seem like a reasonable compromise?

> 
> Rob

Kind regards,
Jeff LaBundy
