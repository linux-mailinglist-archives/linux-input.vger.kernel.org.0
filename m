Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D84BF77BF71
	for <lists+linux-input@lfdr.de>; Mon, 14 Aug 2023 20:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjHNSAK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Aug 2023 14:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbjHNR7o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Aug 2023 13:59:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 347A6124
        for <linux-input@vger.kernel.org>; Mon, 14 Aug 2023 10:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692035983; x=1723571983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPXGn/kCpvnYSeKa5RRhqI1EQVlqrlb2MjYQqXX4V5Y=;
  b=YmTP2p908OIoJvFt3CVmyfzHQrsMBJaVGKhMdyfgLplW4NRWtiIbOBU7
   qDRYV3J2EJNWBGB9piEAxe1vTNjhovZ0q0NVK+R8zmYfwHgFRvna+oA6W
   KNLnACiB2ulbNIqm2SXV0JOGNVUTGi08LcQtkc8cixjZktE9CTiM+Tvju
   C3yVtJTVUzzMMzZ/ctp/oUF+s91tRubPAXSS8/Nf+YKanFdArb3P5lW6M
   Zi3+G48mOQ8DVKTxA2/H04e1CVc3A44OrSp1OYOkinhvEVf9SNOkdlFh8
   CbYmGuueHblCwOnIjsk+7lsA34I7qdCDz2nXenbXsS/gIrd1KJtqsZsPZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438436151"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="438436151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 10:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="877054951"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 14 Aug 2023 10:59:43 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVbqs-0000Km-03;
        Mon, 14 Aug 2023 17:59:38 +0000
Date:   Tue, 15 Aug 2023 01:58:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>
Subject: [hid:for-6.6/steelseries 1/1] drivers/hid/hid-steelseries.c:378:12:
 sparse: sparse: symbol 'arctis_1_battery_request' was not declared. Should
 it be static?
Message-ID: <202308150123.SRaAiV75-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.6/steelseries
head:   a0c76896c3fbdc2e7c70b980b3bb38a6ac445971
commit: a0c76896c3fbdc2e7c70b980b3bb38a6ac445971 [1/1] HID: steelseries: Add support for Arctis 1 XBox
config: i386-randconfig-i061-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150123.SRaAiV75-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150123.SRaAiV75-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150123.SRaAiV75-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-steelseries.c:378:12: sparse: sparse: symbol 'arctis_1_battery_request' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
