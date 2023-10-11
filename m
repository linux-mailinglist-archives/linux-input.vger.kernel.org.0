Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4547C57FF
	for <lists+linux-input@lfdr.de>; Wed, 11 Oct 2023 17:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232760AbjJKPZ2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Oct 2023 11:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbjJKPZ1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Oct 2023 11:25:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1417892;
        Wed, 11 Oct 2023 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697037926; x=1728573926;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=FYNwZ04fT9LxaM3TRvwzePHkTBmq8a+Yom50kgdfabQ=;
  b=TTi2Lbq0tOjEccWYKN4FkAldrcHKD10w7JarkDLUyTqUu+CNKCe9252o
   Iz+ZTOFrD335Un2Hr50nPHZwsB+iooUJKvXo5y4Jcoh8qlmgGe3O7ApHw
   1i+2krOrAdIIuwJy9zTx1kELP5056UawlKyzsLVbe21qwHtmeWnKZrSm8
   HMERSvlsEoR/f0s1BfZBrK7BNw5MtzC0XSwJsUI2PA+pR45VDOW/4UzfY
   IcF6X5G4M+xvhNMMwzMkdLLQS1No30k7O2uJj16llo3W0iZ5vgbxCyuj/
   Dcdop5fPY6ITOKgbmOLVA8K1QG4rkg2agjJM0XZryj1cPyvdW4rbDWnLC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6255243"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="6255243"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 08:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1085266215"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="1085266215"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Oct 2023 08:25:25 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 08:25:25 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 08:25:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 08:25:24 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 08:25:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEBAlTFmmPOR1Qc8BRGHKYfnj0RD9nxh1kaoTf2Znkue8bxI2lbxzBKqiJx8e6s+pli62idUeYKhtXd6pUD5idd1UX0E89PXF6bE8DVNHJgL+SxLimTgGgPFVp3QVtqC4VEFZkfXWjSUDyMnxqYNpjRLcZ0kXhenKWWTvSzvwPfcIaNI8h9AiFiNkvZDqybSd7moDHjxWIwI0XX16rZ10B5LuH0VbgUU+UBWg1is+O41VUTzUMIxCMwb/5o1PeHnBy1eg4sdAro5ndVtI4xKmy7SizvBgdkrEmkS31ho8GH7PY/4nLzICBni0BQw3Qk4ewUKibW/B1iXmnT7ARmIsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpWvi/cdqwG8PtU+N5Y4Dx1k25i7Uhtcv/dDdLG/lQc=;
 b=W+Nbh/Wwo1VcLc49BEi7Q5FhUF1hD4/++mU8iS4tN/KTbuHX3UltkknrH9TT5qNz2f5cTa8lQ7TlzmDL02c7YgifKb+yttGXmRfz30IHKYFA61XmjQ+6Lutrsk6KZbw1QH6B4xvM7Q488hXZijlZtPmY+hqQNCsYpChju0Au0/4fI1f/g3W9l2LLhhVlAEvTKXY74uujC+XrdG0Qx21s6yTU2Aoij7SK9211M8FYi79TsaQZza5ZEr8cHugOjTTttlP3sZHGPB297NEYx6j/VmVIwpUacOwsY88w6NEQ6C/b0UJRyb0dYIa59onD7kQOlHTt7PLzTiyo8ns4+BAfRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 15:25:22 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::d35:d16b:4ee3:77e5%7]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 15:25:22 +0000
Date:   Wed, 11 Oct 2023 23:20:23 +0800
From:   kernel test robot <yujie.liu@intel.com>
To:     Anshul Dalal <anshulusr@gmail.com>, <linux-input@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <oe-kbuild-all@lists.linux.dev>,
        Anshul Dalal <anshulusr@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Message-ID: <202310090414.Iulnmfzb-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231008172435.2391009-1-anshulusr@gmail.com>
X-ClientProxiedBy: KU1PR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:802:18::24) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b57fbba-b39f-4325-3229-08dbca6e4917
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ew2I++IUHUCMBdXe31tRFrSwr5Qc5HUokIKAUj7WxoVoFX87TKSlGRQMVXJEOb5FubzuNzfwvp4oqn6eBUhN2fdwsIL2yfOiU0PgRQky5PNWzC/UQjYiwU93YvBSdXQq7n5l2L7jzs6B6mVMTnwSr/yOPOVk5+e6udwLQsWOhyFdLbYdDFkCN+Fp8UkFh/LghX30vGWy5hGq+BKm/KeZQR4pYApJ77vkL/RlqpvtkPylElyuDArCkzYSCSW/VY9EhtWIVMTcauzprRYqOngdJQgDL7RCHsFSugI/dfjh75p5ta/iKi4YGuhWXBIybFSyyNr1o+uolkG4FINt3KSn9X++KLWIAmwrwAfcv9vlKmg35EaqonbnnTSKYTy84f+C7OUu/9S9fTZTuwABLfb8Uk1AtHDeAV9qAejp+4vz8Ed6rvJ0nnkfklzUb0u+PZt3rChoy3oD7GR1cVO0EqL7Y0yeo0QrapYNIenXMFFvincjuoo+xsZh6smue9zhcIRBb2a3y8HGxIdd4P5csWP2GEZ2CA8WqyQNtYBfKaxFLJv05frk2ahkp3hArVLh69ArgYZEgHoJNsHdXaoFt8+Zlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(26005)(2616005)(1076003)(6512007)(83380400001)(6506007)(8676002)(2906002)(966005)(7416002)(4326008)(5660300002)(66946007)(478600001)(66556008)(54906003)(66476007)(41300700001)(6486002)(8936002)(316002)(86362001)(82960400001)(36756003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b6LvFEuA99HcmrUyN966n3t/fKRaWAR2DNem8uhRdIHyocxSd02jbUT2Ezi7?=
 =?us-ascii?Q?S5FlnSxuGSfQ5AJwCK+ctFfnEKf0TxXeu64ogr3aqQhCXbgNGT9XgjXxt3XT?=
 =?us-ascii?Q?3/LSnyP6t3DGQMxLTL5oseQVTNxsxaF1c+gROXJ/HHEGAzF8DMTRmz8huX+C?=
 =?us-ascii?Q?+sU6UsNrZ5O9OgdLQmeoFhB6qcOBe52609KMvJhZ90/MBf4xaTl2VGQt9O+1?=
 =?us-ascii?Q?mEHNQsDlqqS7SnUa5gpkHTyKLdYXzyLhYaoC86DIhYybNGZof+5/tzrw7b+9?=
 =?us-ascii?Q?yicsvAJsBxjMLTgyCPfujBxu5lp5Ubl6qLmZUydLs3gC2noIF8T2m70KakcY?=
 =?us-ascii?Q?v26s5GSaQPXfD8tuI+pFLQ3/XwdVUOwv+V8c0ujFCG2CN+S19Sa4oEjtaRa5?=
 =?us-ascii?Q?Rnr31iLkIhElVtWx/NCrqs/6aRus5CXyaTrZQNLK8waE4ZE760v+fgO9O12e?=
 =?us-ascii?Q?vOAIKEkmuMSuvmvkupidPPUuOBpxdDJ8yhta5LFQPcEKSmqqQpfd2sjPP2e/?=
 =?us-ascii?Q?rUFURTpO+xPVWTMpHqT8YRDs9HvpG4fe1JaT+jjl0OpJeET1JAhSaxvmPITr?=
 =?us-ascii?Q?+oObvpNAz99v/oF4z+PPeEsdLMxwqGZce0v7c+p6POdcSmxgKnt+mfrMC52L?=
 =?us-ascii?Q?9F2OutD/zT+r5DWfuBflNVKQVrQNbjH/3cnee/FcUpO+qeInRTu8TTm9PWWr?=
 =?us-ascii?Q?NRBa51GPAhP+Di0sNL30IMVOa1qMgCy1PbsDTbEasUyOj4ZmNa3EOlRaIC+F?=
 =?us-ascii?Q?kFO7oXmgT5uSR8Lxamc2aDnAh4/d58Yp1S5RTziOyE+16X5i/qos81A5cs6q?=
 =?us-ascii?Q?x1OCo0nzpBpRhVaP+5CtNmQ3pALm/3ksf3NqfADFFM5lLzEP3gVwg6tdp0jD?=
 =?us-ascii?Q?Cl5CVYEQeJ+1kAiMYssYd8D+SYCOqvtq0eBWzahETFEqLvxWFl/egxHyXnMU?=
 =?us-ascii?Q?TrCgz+UBXX1uWUK1jAninN+k9DXYySGkqS3zFxvbghM0O3uuNCSMRUQ7+PJE?=
 =?us-ascii?Q?lQFtAOMZJm2Xbff1TcELYzDMq84z0SjUbU0QEi5/kt8PPlcmhZ/wL+/toxAg?=
 =?us-ascii?Q?2SuATcKNyEizje01T2jkltZ+k0hXf8ZtE/449xJGH7Rs6A5wEWV96eojWoY2?=
 =?us-ascii?Q?oUKMiv0wgwljL4AhqRuROi22VVX+F3B3gXaH5IUGYBY7XqyZet5WjMQLplx6?=
 =?us-ascii?Q?XuWSLVrpsQXAYtTVfipJ3Owzb7EhZkWIcRUiVSc/5RNnYMOUiPKGgYMCKCFa?=
 =?us-ascii?Q?PGVgWQ5YMDZHqP+OiELBk0cZj+yqIQpEWJDaBfAqI876QbK7Lf17n0bw3h0L?=
 =?us-ascii?Q?ZIHg0OIVZe903rhZalIaa9a70WgMmn0QvcbPBMabjxsZ7MIdarUIRjJv1Kgh?=
 =?us-ascii?Q?tfz/v0+FPugVcTHK73clQWQUnE9u4n5BNJs8/wSOfUHtbnXfMnj+w6rTgZvy?=
 =?us-ascii?Q?bM/4SYlUop0K0lwXwmB5SO6PdTXP7fHSCU6rcQuBwLwWr2LBjPmz07iJYcQ0?=
 =?us-ascii?Q?uufwmXkkXaoh0UF/0CkgNsf7QedUNJOi50vs7JDaN9wyvF0b606dFmW+/eLp?=
 =?us-ascii?Q?RlzUWCoDYFGLy97ZsOexiad+yQGzCdNl+kh9wRNL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b57fbba-b39f-4325-3229-08dbca6e4917
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 15:25:22.7555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjMF+xIcWnLAqk4sZmE+hdh/zL1IPmz4evlhvDtZWuUcHxjD5K2kikqROgi/bCFnM1uyzO7wX0Iezkqy2XVw5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Anshul,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus hid/for-next linus/master v6.6-rc4 next-20231006]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshul-Dalal/input-joystick-driver-for-Adafruit-Seesaw-Gamepad/20231009-012745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20231008172435.2391009-1-anshulusr%40gmail.com
patch subject: [PATCH v2 1/2] dt-bindings: input: bindings for Adafruit Seesaw Gamepad
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231009/202310090414.Iulnmfzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202310090414.Iulnmfzb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
    	 $id: http://devicetree.org/schemas/input/adafruit_seesaw.yaml
    	file: Documentation/devicetree/bindings/input/adafruit,seesaw-gamepad.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

