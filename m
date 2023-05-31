Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 775997187BE
	for <lists+linux-input@lfdr.de>; Wed, 31 May 2023 18:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjEaQqp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 May 2023 12:46:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbjEaQql (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 May 2023 12:46:41 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A33018C;
        Wed, 31 May 2023 09:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685551600; x=1717087600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OHgj5x9BlTOsr+jbuUC5FRn0FouRgE7wpNKD+K6wmEE=;
  b=BkvpiWvW1b5fy4WXr/CbxjmDeGjAtSeBgvsm1IPeyWa8MAlRb3q0Y7L7
   LcVspy0hTzBYjEku8mvMIsxnQST6ajD9+cgP4oaLPewvhe9IfAnjS0ox1
   KzbQOO1JgHGwCBd6rrd5tHzY7lPzJX2zAyX9Ftge8doYOcOhOhBjbCPIQ
   9iaDcOzZmhFjAZcrSZR2zJBmIxHNQx5TbDzTgwOP7E77BVw59bOj48Xox
   Z975FgVOAwmv14wiOzYcnGDrANYGOWdCOuWbiePty/hYdVrRCu607ZCSC
   e+SzIvBvp30EnEbD4Nn4CDxaVhnWNFK5dfAIElj11AEf4BOBMHP5ND9RW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354138620"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="354138620"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 09:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="796775221"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="796775221"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 May 2023 09:46:34 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1q4Oy1-0001Uv-1V;
        Wed, 31 May 2023 16:46:33 +0000
Date:   Thu, 1 Jun 2023 00:45:56 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, jeff@labundy.com
Subject: Re: [PATCH 2/2] Input: iqs7222 - add support for Azoteq IQS7222D
Message-ID: <202306010012.Dmk3yaas-lkp@intel.com>
References: <ZHaoFCIpUM6ocPKO@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHaoFCIpUM6ocPKO@nixie71>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

kernel test robot noticed the following build warnings:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on dtor-input/for-linus robh/for-next hid/for-next linus/master v6.4-rc4 next-20230531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeff-LaBundy/Input-iqs7222-add-support-for-Azoteq-IQS7222D/20230531-095226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/ZHaoFCIpUM6ocPKO%40nixie71
patch subject: [PATCH 2/2] Input: iqs7222 - add support for Azoteq IQS7222D
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230601/202306010012.Dmk3yaas-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/b8b40762779cc4c0208ff51ef9fbb2d8015ba164
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jeff-LaBundy/Input-iqs7222-add-support-for-Azoteq-IQS7222D/20230531-095226
        git checkout b8b40762779cc4c0208ff51ef9fbb2d8015ba164
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/input/misc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010012.Dmk3yaas-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/misc/iqs7222.c: In function 'iqs7222_parse_tpad':
>> drivers/input/misc/iqs7222.c:2574:36: warning: unused variable 'val' [-Wunused-variable]
    2574 |         unsigned int chan_sel[12], val;
         |                                    ^~~


vim +/val +2574 drivers/input/misc/iqs7222.c

  2563	
  2564	static int iqs7222_parse_tpad(struct iqs7222_private *iqs7222,
  2565				      struct fwnode_handle *tpad_node, int tpad_index)
  2566	{
  2567		const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
  2568		struct touchscreen_properties *prop = &iqs7222->prop;
  2569		struct i2c_client *client = iqs7222->client;
  2570		int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
  2571		int count, error, i;
  2572		u16 *event_mask = &iqs7222->sys_setup[dev_desc->event_offset];
  2573		u16 *tpad_setup = iqs7222->tpad_setup;
> 2574		unsigned int chan_sel[12], val;
  2575	
  2576		error = iqs7222_parse_props(iqs7222, tpad_node, tpad_index,
  2577					    IQS7222_REG_GRP_TPAD,
  2578					    IQS7222_REG_KEY_NONE);
  2579		if (error)
  2580			return error;
  2581	
  2582		count = fwnode_property_count_u32(tpad_node, "azoteq,channel-select");
  2583		if (count < 0) {
  2584			dev_err(&client->dev, "Failed to count %s channels: %d\n",
  2585				fwnode_get_name(tpad_node), count);
  2586			return count;
  2587		} else if (!count || count > ARRAY_SIZE(chan_sel)) {
  2588			dev_err(&client->dev, "Invalid number of %s channels\n",
  2589				fwnode_get_name(tpad_node));
  2590			return -EINVAL;
  2591		}
  2592	
  2593		error = fwnode_property_read_u32_array(tpad_node,
  2594						       "azoteq,channel-select",
  2595						       chan_sel, count);
  2596		if (error) {
  2597			dev_err(&client->dev, "Failed to read %s channels: %d\n",
  2598				fwnode_get_name(tpad_node), error);
  2599			return error;
  2600		}
  2601	
  2602		tpad_setup[6] &= ~GENMASK(num_chan - 1, 0);
  2603	
  2604		for (i = 0; i < ARRAY_SIZE(chan_sel); i++) {
  2605			tpad_setup[8 + i] = 0;
  2606			if (i >= count || chan_sel[i] == U8_MAX)
  2607				continue;
  2608	
  2609			if (chan_sel[i] >= num_chan) {
  2610				dev_err(&client->dev, "Invalid %s channel: %u\n",
  2611					fwnode_get_name(tpad_node), chan_sel[i]);
  2612				return -EINVAL;
  2613			}
  2614	
  2615			/*
  2616			 * The following fields indicate which channels participate in
  2617			 * the trackpad, as well as each channel's relative placement.
  2618			 */
  2619			tpad_setup[6] |= BIT(chan_sel[i]);
  2620			tpad_setup[8 + i] = chan_sel[i] * 34 + 1072;
  2621		}
  2622	
  2623		tpad_setup[7] = dev_desc->touch_link;
  2624		if (fwnode_property_present(tpad_node, "azoteq,use-prox"))
  2625			tpad_setup[7] -= 2;
  2626	
  2627		for (i = 0; i < ARRAY_SIZE(iqs7222_tp_events); i++)
  2628			tpad_setup[20] &= ~(iqs7222_tp_events[i].strict |
  2629					    iqs7222_tp_events[i].enable);
  2630	
  2631		for (i = 0; i < ARRAY_SIZE(iqs7222_tp_events); i++) {
  2632			const char *event_name = iqs7222_tp_events[i].name;
  2633			struct fwnode_handle *event_node;
  2634	
  2635			event_node = fwnode_get_named_child_node(tpad_node, event_name);
  2636			if (!event_node)
  2637				continue;
  2638	
  2639			if (fwnode_property_present(event_node,
  2640						    "azoteq,gesture-angle-tighten"))
  2641				tpad_setup[20] |= iqs7222_tp_events[i].strict;
  2642	
  2643			tpad_setup[20] |= iqs7222_tp_events[i].enable;
  2644	
  2645			error = iqs7222_parse_event(iqs7222, event_node, tpad_index,
  2646						    IQS7222_REG_GRP_TPAD,
  2647						    iqs7222_tp_events[i].reg_key,
  2648						    iqs7222_tp_events[i].link, 1566,
  2649						    NULL,
  2650						    &iqs7222->tp_code[i]);
  2651			fwnode_handle_put(event_node);
  2652			if (error)
  2653				return error;
  2654	
  2655			if (!dev_desc->event_offset)
  2656				continue;
  2657	
  2658			/*
  2659			 * The press/release event is determined based on whether the
  2660			 * coordinate fields report 0xFFFF and solely relies on touch
  2661			 * or proximity interrupts to be unmasked.
  2662			 */
  2663			if (i)
  2664				*event_mask |= IQS7222_EVENT_MASK_TPAD;
  2665			else if (tpad_setup[7] == dev_desc->touch_link)
  2666				*event_mask |= IQS7222_EVENT_MASK_TOUCH;
  2667			else
  2668				*event_mask |= IQS7222_EVENT_MASK_PROX;
  2669		}
  2670	
  2671		if (!iqs7222->tp_code[0])
  2672			return 0;
  2673	
  2674		input_set_abs_params(iqs7222->keypad, ABS_X,
  2675				     0, (tpad_setup[4] ? : 1) - 1, 0, 0);
  2676	
  2677		input_set_abs_params(iqs7222->keypad, ABS_Y,
  2678				     0, (tpad_setup[5] ? : 1) - 1, 0, 0);
  2679	
  2680		touchscreen_parse_properties(iqs7222->keypad, false, prop);
  2681	
  2682		if (prop->max_x >= U16_MAX || prop->max_y >= U16_MAX) {
  2683			dev_err(&client->dev, "Invalid trackpad size: %u*%u\n",
  2684				prop->max_x, prop->max_y);
  2685			return -EINVAL;
  2686		}
  2687	
  2688		tpad_setup[4] = prop->max_x + 1;
  2689		tpad_setup[5] = prop->max_y + 1;
  2690	
  2691		return 0;
  2692	}
  2693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
