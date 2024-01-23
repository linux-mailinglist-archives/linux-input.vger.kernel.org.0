Return-Path: <linux-input+bounces-1407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC3A839480
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 17:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 646131C209E0
	for <lists+linux-input@lfdr.de>; Tue, 23 Jan 2024 16:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978656281F;
	Tue, 23 Jan 2024 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="nVQoE57g"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02olkn2096.outbound.protection.outlook.com [40.92.15.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC2960ED7
	for <linux-input@vger.kernel.org>; Tue, 23 Jan 2024 16:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.15.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706026655; cv=fail; b=Vjh8bB6oU15AEbJB9wbgxObaPtQxnhpnZzAQmUsm70UIuGNfoiERqfucmq1iKXV9rnQY4/E740PMk1cin+f4dYl1wMqguEnlfxTl2udbvSu6ytDMlCF2VCmp6VWbLKmhbedPvgLWxL/rr9eLhTweN5jU2wBp/eokihSAoPtAo7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706026655; c=relaxed/simple;
	bh=k0aRW2+h6WGP3cvU8Com55iIu8MmG9WnnytTuqpGtUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JcWS9q2ADwIbuytUZvrhDhc/BLWKdmZCMGECvvX0i5jFnR2MClJevWL2Gmue7JP9HTnyuyrhSTs33bidke0TdnWOiakgqI4txThhXNudFIlHg6NBqKfyP5y4ShcWpf2r1M2aLDfl4I97CtFuY8SjkZymECG2ezujmrMp2RjS2Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=nVQoE57g; arc=fail smtp.client-ip=40.92.15.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgSsZOPJExsjuDQQ9ukIBniOGKfqy0h4mSKm+3y+XvpLxJ8+/4b1O/5CajTxqu+3sHOWQ+cj1do3QXmXEcKAIroItIpAa13VmYDMqHG+C8nBLXSsTvIFwc/kkDzyC9OzfZhXrj5yxOnwzEZNp7nyt0YqbKgUZc2FY8RrRY7DhjZogN7F2m30gTMkjMLkteAAV9AXiN6ia8VdIYwYxmnAJUH7viZ46S3sES3759UyO/C82i2whISXrZT7cXEUmHoE0e4qpm8NJdQbBE+6nkH//VbeFuwfgzsogV5zY7ViZUJ5ge6MzC8Ci9OLCppGx6qKS0/zFOm7cyUvHjSFPf6orQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1XfHHsWv9n+x934An30gPSO5c8tp2idlbh9fDuPqyk=;
 b=fv+Bf05FWIS7pa2E1bADRFyjjHc6ukaqbYvC8rnRgCe1JAjVF+ILGIo8MaiiwWFU2mehTLawyEni2pcq9O3I8FVWdhRDZKjeR7LR1huFqRFV2AIT4wMv/5AwQeIN9Wh4zcKwKTnjURUh2GOSS6dChx3Kpl/RoCE+9dBPIaO5/RoX9SuKWnw1+MsuXDghSM07VZqmRp/W8Gqdv3EGJOu5YKhAnnT5RTxg62ylGScMa3aHMG9oHbl0Aa5Q4tIdJYfsK5sQpijpYsFnbnnQtOc5bgZKF/6MpZEdX/GSlJb10TDbgb4P347G8Uu2WiGTJ5rFNsqlxqNErNOZmHjugf+axQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1XfHHsWv9n+x934An30gPSO5c8tp2idlbh9fDuPqyk=;
 b=nVQoE57gersQAw6tDqLtoZidxi330IdiPfYMjoWUBat/s7IaGFmOzj7V1A3e7yzD5olJcNNE9A/HCN1+J+FxErAe4xPZEZPqm9aMydV56R3kzn0GRCi5dOClGLm/5DA4dPq1rqjPC8j8snKHgOhUvqC1VfcQSiCwK7AlA2Q3xz8ELjJ01KjDSKWEqVma3WceIYQVL/JfaHs/9NYtwnT+QnswSCL8BzLRFxw4ln7ntlExHks2yqs09+rpuo1CBCC+g3k+t3uAxJ6/mIO1dB0fWV6/54ZH0y9brXtf5eS0s95la8YFuSKnXj4NdkF7W0qRILLT/SAgwuUpY6x7ZYcGOw==
Received: from DM6PR06MB5337.namprd06.prod.outlook.com (2603:10b6:5:102::19)
 by PH8PR06MB9193.namprd06.prod.outlook.com (2603:10b6:510:252::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 16:17:30 +0000
Received: from DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::b6d9:817e:2fb3:168c]) by DM6PR06MB5337.namprd06.prod.outlook.com
 ([fe80::b6d9:817e:2fb3:168c%7]) with mapi id 15.20.7202.035; Tue, 23 Jan 2024
 16:17:30 +0000
Date: Tue, 23 Jan 2024 10:17:25 -0600
From: Chris Morgan <macromorgan@hotmail.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [dtor-input:next 134/135]
 drivers/input/joystick/adc-joystick.c:194:10: error: implicit declaration of
 function 'min_array'
Message-ID:
 <DM6PR06MB533707F89AA767C845DD3D68A5742@DM6PR06MB5337.namprd06.prod.outlook.com>
References: <202401200614.B4PnBzhk-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202401200614.B4PnBzhk-lkp@intel.com>
X-TMN: [JDQGM3vMy68H2h69iPO3HgOqtzYNCLB0]
X-ClientProxiedBy: SA9PR13CA0091.namprd13.prod.outlook.com
 (2603:10b6:806:24::6) To DM6PR06MB5337.namprd06.prod.outlook.com
 (2603:10b6:5:102::19)
X-Microsoft-Original-Message-ID: <Za/mlYRQDH5NWyc5@wintermute.localhost.fail>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR06MB5337:EE_|PH8PR06MB9193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da381e6-41cf-427e-8390-08dc1c2ecb77
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CoOicq5q4lUiWmKIxMcSg74NB+h3efvkUf31rFDFGrXgj7W/vaB2hXzI+/Ne1k2wbMIAoWVUCkxevY5ZmqMdkC2VXAPmjmALSkiB03xaus5IgTQvmlUYsetBJvk+SexI/4BQo1gRmtANKrsO+NnETP8IBhPBbJY14t2HSFUKPIm7s0W+xCKhwn957vnbHB96Au7yOiKr6XLQJi4914wdwct4Frp+bZjhzCVK14Qk2eLorz5QNp/FtQD8KP42vyF3dcIVa64hwH+m6CS9NVGfjSfFV94+jKH/hjCXueVtTaN/wLad2dII2pPNpgAGpsmruVgZw98JF2XiAzxztpDW2A07X3z0Kj3juFKzhSzB7Od/z/6rpK/SwzkdlH8eoytAYp162b9X1HhfwVaISAacBXWkq+G3YK84M3wTu45Ulf32POXnRVaW8ZPdldN791PjmlhnpFoqewz/pD7Y7ngG6l1TA9OagxkSg+h1w4x/z9fBx5XCk7oLhADY7Sh5jmsG0SLzdCQCYT9pVmluFbdPByXyhBQNl+ev0UipRn+aqDU5PzNwzANUX8Vny7RYZXjBxsEnZxb6XLULrCX0NP2dL6yY81EjCT2J82vuh6rNE10=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9dclsev1oStLQ2Q1MikKjQRJ1cOx/usrvPY8gO2xTXZ1Kh1ivn5XmLrRxuKr?=
 =?us-ascii?Q?54ybuggncSmD4GSgbpLNhxVz6GY92NQvVa4/WJNI5UNRTF7A49KEsFiijM6t?=
 =?us-ascii?Q?vmuDz7DgyIUUzrJ6nwsueROEDJvrOR1ShrqaC/E9NvYm78TfUKumZk2r+WKB?=
 =?us-ascii?Q?HWLWjK+rO1dssh19o8BzrLnXVIsC6WAaJ2jlsFjRjKGkGLL6SniKA+cB5KIo?=
 =?us-ascii?Q?JH58In6HBePRYfsFopWa/FkaSZOEeGFnb77h4qPZrzG6pEcU79Zf0CvkI3vl?=
 =?us-ascii?Q?kRVMuWj2kbGtaubTnsR35s2+ZHftf/PAyAs+q7ecZsIGMkJ1MALkUQoGkl5w?=
 =?us-ascii?Q?I4IK2zqlWSEgGUuemNo/DPL8+IB8cSGjQ9fx9/4YBYv4wFbY3Ng0w9rmjBue?=
 =?us-ascii?Q?MEs2fs2+t9zB5gR5CJFrszNvrg/43V+FiEMJ7ow8m1GEIbOjOl9TdflBVCvb?=
 =?us-ascii?Q?FxbVVXQmrcZQ6DsaQs/JN3d0mBHTqs2QdHThGFbSdgiG5uJW34hgXc+xkn9A?=
 =?us-ascii?Q?XltfLrVUPzyhXyIow0ceR3foqZcQs/zIDgzvfqXqdb3EC1AhEUWogOgdPyVl?=
 =?us-ascii?Q?yFwYbxJAzAyqPqfLjwtppbeVbyab1orFs0oipUl9R7mNSUAPI/lJmCEoFX87?=
 =?us-ascii?Q?CYZklnTjsMGhEx4b6+XouaqQcU5I4wCiIv9wMkCCOH3HvHsAPgnjlTJcKB3D?=
 =?us-ascii?Q?aGacOp+IBozgazYQqjhLs1RYGnRnauuO06MzO3yEBS0Eoki80EmuM/lXBapr?=
 =?us-ascii?Q?vPJemARWpzBE30D2Uk3E4/LDLpbO3N9lfXeG3uDIdComyuIkMSrJKKl7g5Eu?=
 =?us-ascii?Q?WwZrqapJTMBv9ecQVXbpOVYd24I+d3jMD0wvbZQGPUJ3hd+cm2B0Lj6UA8wz?=
 =?us-ascii?Q?hbAXsMneyo64Ihbs8MxhtXBQk+vkke/DTudE06NroUBILCzxCd9UQFrdYGNL?=
 =?us-ascii?Q?Mou/hUOO5Ij0CM8wg1wJb1RPmtAyFmcjd2ptaZYaXwpD2sBJ14KFVn6BELuR?=
 =?us-ascii?Q?oBpfUSmMtiyBDvkOBV9JX6DaIaiPcpuIrUpcbnHVlEeHVXKwOpDf6SaoLpg6?=
 =?us-ascii?Q?ci8JRQ/eyPtI92mqILhRyacBzNa3O3cBwDyDmtsw0IGaJYhV2SQdnUTGZ7FP?=
 =?us-ascii?Q?PBhaOkyAVheM1U/BGpVirOeqa0Q0OH+edfbDFtlEkbBl9ZD+ou6sb8vf8fVs?=
 =?us-ascii?Q?6UB5n8Rz5Wx7YoFYCPicYnphjzN84qGFW8CiNJlfQNjjKeSFDJ7U6wRRD5g?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da381e6-41cf-427e-8390-08dc1c2ecb77
X-MS-Exchange-CrossTenant-AuthSource: DM6PR06MB5337.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 16:17:30.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR06MB9193

On Sat, Jan 20, 2024 at 06:55:32AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> head:   3af6e24a456437d323d1080bd254053f7af05234
> commit: 6380a59c534ecab1462608a1f76490289a45a377 [134/135] Input: adc-joystick - handle inverted axes
> config: i386-randconfig-011-20240120 (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401200614.B4PnBzhk-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401200614.B4PnBzhk-lkp@intel.com/
> 

Assume this means we need to explicitly `#include <linux/minmax.h>`, right?

Should I submit a new patch or a bugfix for this patch?

Thank you.

> All errors (new ones prefixed by >>):
> 
>    drivers/input/joystick/adc-joystick.c: In function 'adc_joystick_set_axes':
> >> drivers/input/joystick/adc-joystick.c:194:10: error: implicit declaration of function 'min_array' [-Werror=implicit-function-declaration]
>      194 |          min_array(axes[i].range, 2),
>          |          ^~~~~~~~~
> >> drivers/input/joystick/adc-joystick.c:195:10: error: implicit declaration of function 'max_array'; did you mean 'kmalloc_array'? [-Werror=implicit-function-declaration]
>      195 |          max_array(axes[i].range, 2),
>          |          ^~~~~~~~~
>          |          kmalloc_array
>    cc1: some warnings being treated as errors
> 
> 
> vim +/min_array +194 drivers/input/joystick/adc-joystick.c
> 
>    135	
>    136	static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
>    137	{
>    138		struct adc_joystick_axis *axes;
>    139		struct fwnode_handle *child;
>    140		int num_axes, error, i;
>    141	
>    142		num_axes = device_get_child_node_count(dev);
>    143		if (!num_axes) {
>    144			dev_err(dev, "Unable to find child nodes\n");
>    145			return -EINVAL;
>    146		}
>    147	
>    148		if (num_axes != joy->num_chans) {
>    149			dev_err(dev, "Got %d child nodes for %d channels\n",
>    150				num_axes, joy->num_chans);
>    151			return -EINVAL;
>    152		}
>    153	
>    154		axes = devm_kmalloc_array(dev, num_axes, sizeof(*axes), GFP_KERNEL);
>    155		if (!axes)
>    156			return -ENOMEM;
>    157	
>    158		device_for_each_child_node(dev, child) {
>    159			error = fwnode_property_read_u32(child, "reg", &i);
>    160			if (error) {
>    161				dev_err(dev, "reg invalid or missing\n");
>    162				goto err_fwnode_put;
>    163			}
>    164	
>    165			if (i >= num_axes) {
>    166				error = -EINVAL;
>    167				dev_err(dev, "No matching axis for reg %d\n", i);
>    168				goto err_fwnode_put;
>    169			}
>    170	
>    171			error = fwnode_property_read_u32(child, "linux,code",
>    172							 &axes[i].code);
>    173			if (error) {
>    174				dev_err(dev, "linux,code invalid or missing\n");
>    175				goto err_fwnode_put;
>    176			}
>    177	
>    178			error = fwnode_property_read_u32_array(child, "abs-range",
>    179							       axes[i].range, 2);
>    180			if (error) {
>    181				dev_err(dev, "abs-range invalid or missing\n");
>    182				goto err_fwnode_put;
>    183			}
>    184	
>    185			if (axes[i].range[0] > axes[i].range[1]) {
>    186				dev_dbg(dev, "abs-axis %d inverted\n", i);
>    187				axes[i].inverted = true;
>    188			}
>    189	
>    190			fwnode_property_read_u32(child, "abs-fuzz", &axes[i].fuzz);
>    191			fwnode_property_read_u32(child, "abs-flat", &axes[i].flat);
>    192	
>    193			input_set_abs_params(joy->input, axes[i].code,
>  > 194					     min_array(axes[i].range, 2),
>  > 195					     max_array(axes[i].range, 2),
>    196					     axes[i].fuzz, axes[i].flat);
>    197			input_set_capability(joy->input, EV_ABS, axes[i].code);
>    198		}
>    199	
>    200		joy->axes = axes;
>    201	
>    202		return 0;
>    203	
>    204	err_fwnode_put:
>    205		fwnode_handle_put(child);
>    206		return error;
>    207	}
>    208	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

