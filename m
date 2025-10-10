Return-Path: <linux-input+bounces-15367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FFBCE695
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 21:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6277D4E2145
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 19:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E22E3016F6;
	Fri, 10 Oct 2025 19:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OFAJEZC4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A83016EA;
	Fri, 10 Oct 2025 19:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760125461; cv=none; b=RAwxvczjFKzoCBLHPC12eIP5nHJ7WWn2Iea30bO58ShQhShUAi4pusJ2wuEldKK2D2nV5e16mkjlCipypU9fJX1N4SXQsLs4NqJKfyHXS5xs9OjqhHxLXXOS9Kexdjex/JCKcztb/oFAOIqVcFYFAMQ+nSrKOVRMVH2Ezdmg9Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760125461; c=relaxed/simple;
	bh=08jh/wWNVQ1Hr0SzTZPtMljTCBAq+04w4969ErdWQAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gp/nG1S5H0W5bSmqWDEcB1KMrZ4srB4XpI+MT7Pf+thync0tyLM6KyGxys5bMXPSBNL1FVeTziY7s8lyv429m90OylwWFLMMGUUStXFSdUe+d+0UsFvdl3FEJCDfln93qipdlx448wchcZdf0TIvqO66EpUgX+fAJK5cYYc8uws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OFAJEZC4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760125459; x=1791661459;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=08jh/wWNVQ1Hr0SzTZPtMljTCBAq+04w4969ErdWQAs=;
  b=OFAJEZC4SHMJdZMd1AecoWBc0gAV+pO+XoXCjk1j8LahXfQGUuCTiRv5
   mRewbLy/naD/5HzX92MpP0SRnQMto5WeYyzzc/fDOoOWasd9Uo+maO93E
   E03ptrox+oWFJKplBGirV31fEZi0aexWDtmXH7oZnKX26q0QNhoDbbt7I
   2hcg1yh01BrOEdNEcazYcIP8XDDXQJhozED6AQhfkmosQxHhIhJPOBKD2
   ZKSlUmjY8xJfj4f9SiR1WfKGbsyKVZMz2ES5pl/qxNFk31gAoSQo8fqLG
   tOrwadl2pZ3rsHG4FrDvTuvZtBIZU3diCdAPPEckgL3vjGLHl/RTEK42k
   w==;
X-CSE-ConnectionGUID: qnpTdkhdTUSfOpe4PpG1vA==
X-CSE-MsgGUID: trFId7p2Q4iCMZ19f+IAcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="73791147"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="73791147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 12:44:19 -0700
X-CSE-ConnectionGUID: MyZn7C6nRlSo9464mF0yNQ==
X-CSE-MsgGUID: pmcPCNmDRnuuhCneKuQJ3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="211700533"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2025 12:44:17 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7J2E-00036d-1Y;
	Fri, 10 Oct 2025 19:44:14 +0000
Date: Sat, 11 Oct 2025 03:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: pip-izony <eeodqql09@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: pegasus-notetaker - fix out-of-bounds access
 vulnerability in pegasus_parse_packet() function of the pegasus driver
Message-ID: <202510110303.ibbCe4PD-lkp@intel.com>
References: <20251007214131.3737115-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007214131.3737115-2-eeodqql09@gmail.com>

Hi pip-izony,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/pip-izony/Input-pegasus-notetaker-fix-out-of-bounds-access-vulnerability-in-pegasus_parse_packet-function-of-the-pegasus-driver/20251009-180618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20251007214131.3737115-2-eeodqql09%40gmail.com
patch subject: [PATCH] Input: pegasus-notetaker - fix out-of-bounds access vulnerability in pegasus_parse_packet() function of the pegasus driver
config: powerpc64-randconfig-r073-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110303.ibbCe4PD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110303.ibbCe4PD-lkp@intel.com/

smatch warnings:
drivers/input/tablet/pegasus_notetaker.c:314 pegasus_probe() warn: inconsistent indenting

vim +314 drivers/input/tablet/pegasus_notetaker.c

   270	
   271	static int pegasus_probe(struct usb_interface *intf,
   272				 const struct usb_device_id *id)
   273	{
   274		struct usb_device *dev = interface_to_usbdev(intf);
   275		struct usb_endpoint_descriptor *endpoint;
   276		struct pegasus *pegasus;
   277		struct input_dev *input_dev;
   278		int error;
   279		int pipe;
   280	
   281		/* We control interface 0 */
   282		if (intf->cur_altsetting->desc.bInterfaceNumber >= 1)
   283			return -ENODEV;
   284	
   285		/* Sanity check that the device has an endpoint */
   286		if (intf->cur_altsetting->desc.bNumEndpoints < 1) {
   287			dev_err(&intf->dev, "Invalid number of endpoints\n");
   288			return -EINVAL;
   289		}
   290	
   291		endpoint = &intf->cur_altsetting->endpoint[0].desc;
   292	
   293		pegasus = kzalloc(sizeof(*pegasus), GFP_KERNEL);
   294		input_dev = input_allocate_device();
   295		if (!pegasus || !input_dev) {
   296			error = -ENOMEM;
   297			goto err_free_mem;
   298		}
   299	
   300		mutex_init(&pegasus->pm_mutex);
   301	
   302		pegasus->usbdev = dev;
   303		pegasus->dev = input_dev;
   304		pegasus->intf = intf;
   305	
   306		pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
   307		/* Sanity check that pipe's type matches endpoint's type */
   308		if (usb_pipe_type_check(dev, pipe)) {
   309			error = -EINVAL;
   310			goto err_free_mem;
   311		}
   312	
   313		pegasus->data_len = usb_maxpacket(dev, pipe);
 > 314	    if (pegasus->data_len < 5) {
   315			dev_err(&intf->dev, "Invalid number of wMaxPacketSize\n");
   316			error = -EINVAL;
   317			goto err_free_mem;
   318		}
   319	
   320		pegasus->data = usb_alloc_coherent(dev, pegasus->data_len, GFP_KERNEL,
   321						   &pegasus->data_dma);
   322		if (!pegasus->data) {
   323			error = -ENOMEM;
   324			goto err_free_mem;
   325		}
   326	
   327		pegasus->irq = usb_alloc_urb(0, GFP_KERNEL);
   328		if (!pegasus->irq) {
   329			error = -ENOMEM;
   330			goto err_free_dma;
   331		}
   332	
   333		usb_fill_int_urb(pegasus->irq, dev, pipe,
   334				 pegasus->data, pegasus->data_len,
   335				 pegasus_irq, pegasus, endpoint->bInterval);
   336	
   337		pegasus->irq->transfer_dma = pegasus->data_dma;
   338		pegasus->irq->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
   339	
   340		if (dev->manufacturer)
   341			strscpy(pegasus->name, dev->manufacturer,
   342				sizeof(pegasus->name));
   343	
   344		if (dev->product) {
   345			if (dev->manufacturer)
   346				strlcat(pegasus->name, " ", sizeof(pegasus->name));
   347			strlcat(pegasus->name, dev->product, sizeof(pegasus->name));
   348		}
   349	
   350		if (!strlen(pegasus->name))
   351			snprintf(pegasus->name, sizeof(pegasus->name),
   352				 "USB Pegasus Device %04x:%04x",
   353				 le16_to_cpu(dev->descriptor.idVendor),
   354				 le16_to_cpu(dev->descriptor.idProduct));
   355	
   356		usb_make_path(dev, pegasus->phys, sizeof(pegasus->phys));
   357		strlcat(pegasus->phys, "/input0", sizeof(pegasus->phys));
   358	
   359		INIT_WORK(&pegasus->init, pegasus_init);
   360	
   361		usb_set_intfdata(intf, pegasus);
   362	
   363		input_dev->name = pegasus->name;
   364		input_dev->phys = pegasus->phys;
   365		usb_to_input_id(dev, &input_dev->id);
   366		input_dev->dev.parent = &intf->dev;
   367	
   368		input_set_drvdata(input_dev, pegasus);
   369	
   370		input_dev->open = pegasus_open;
   371		input_dev->close = pegasus_close;
   372	
   373		__set_bit(EV_ABS, input_dev->evbit);
   374		__set_bit(EV_KEY, input_dev->evbit);
   375	
   376		__set_bit(ABS_X, input_dev->absbit);
   377		__set_bit(ABS_Y, input_dev->absbit);
   378	
   379		__set_bit(BTN_TOUCH, input_dev->keybit);
   380		__set_bit(BTN_RIGHT, input_dev->keybit);
   381		__set_bit(BTN_TOOL_PEN, input_dev->keybit);
   382	
   383		__set_bit(INPUT_PROP_DIRECT, input_dev->propbit);
   384		__set_bit(INPUT_PROP_POINTER, input_dev->propbit);
   385	
   386		input_set_abs_params(input_dev, ABS_X, -1500, 1500, 8, 0);
   387		input_set_abs_params(input_dev, ABS_Y, 1600, 3000, 8, 0);
   388	
   389		error = input_register_device(pegasus->dev);
   390		if (error)
   391			goto err_free_urb;
   392	
   393		return 0;
   394	
   395	err_free_urb:
   396		usb_free_urb(pegasus->irq);
   397	err_free_dma:
   398		usb_free_coherent(dev, pegasus->data_len,
   399				  pegasus->data, pegasus->data_dma);
   400	err_free_mem:
   401		input_free_device(input_dev);
   402		kfree(pegasus);
   403		usb_set_intfdata(intf, NULL);
   404	
   405		return error;
   406	}
   407	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

