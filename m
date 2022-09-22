Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC255E5B9F
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 08:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiIVGtI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 02:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiIVGtH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 02:49:07 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A09BB7282
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 23:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663829346; x=1695365346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DIgfExlmfrHNpujiaqdMIYpWBeHYs0B2T51+9ZcokPQ=;
  b=QirYO7DMHANf4zNLXFx5yEXniIeQ93iDwg6PBWDbe6PvTTKfqSAK953u
   5j7MgeGCAt2tyWronfiFAobbZSNVIeNTT5l+1/dICl7tMBGtudwE46yrN
   KCgdcEvJvK54acOqpOEZkWZ+ikjxJrPzw0Gmq67/ApIiZ5XOCrtqrqg5i
   Fud9xP6LvuyR73nggJ7U1nowq6iigNbI7P0wIqO2reenEI2Ps5Nn8eI7r
   WGMAOgXKUkm4gvEul+S9QPTbPcmU9WwPbQTdv2pScPX7xyrzquE+A6rva
   +DE0BOVFaZLs267Zhd81w10AA9u/NfLWZJbRW6eojxYXbz2BZV0mXaosr
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300201608"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="300201608"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 23:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="570849970"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Sep 2022 23:49:04 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obG19-0004Oa-2s;
        Thu, 22 Sep 2022 06:49:03 +0000
Date:   Thu, 22 Sep 2022 14:48:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org
Subject: [dtor-input:gpio-test 7950/7967]
 drivers/pci/controller/pci-mvebu.c:1344:30: error: too few arguments to
 function call, expected 2, have 1
Message-ID: <202209221435.MEm88ThW-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git gpio-test
head:   53be931d133999d54ca1f0869ffb0aed731a0289
commit: 6bd0d18045802306e7986d47d43843d3ed388d4f [7950/7967] PCI: mvebu: switch to using gpiod API
config: arm-defconfig (https://download.01.org/0day-ci/archive/20220922/202209221435.MEm88ThW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=6bd0d18045802306e7986d47d43843d3ed388d4f
        git remote add dtor-input https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
        git fetch --no-tags dtor-input gpio-test
        git checkout 6bd0d18045802306e7986d47d43843d3ed388d4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/controller/pci-mvebu.c:1100:2: error: call to undeclared function 'chained_irq_enter'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           chained_irq_enter(chip, desc);
           ^
   drivers/pci/controller/pci-mvebu.c:1115:2: error: call to undeclared function 'chained_irq_exit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           chained_irq_exit(chip, desc);
           ^
>> drivers/pci/controller/pci-mvebu.c:1344:30: error: too few arguments to function call, expected 2, have 1
                   devm_kfree(port->reset_name);
                   ~~~~~~~~~~                 ^
   include/linux/device.h:226:6: note: 'devm_kfree' declared here
   void devm_kfree(struct device *dev, const void *p);
        ^
   3 errors generated.


vim +1344 drivers/pci/controller/pci-mvebu.c

  1258	
  1259	static int mvebu_pcie_parse_port(struct mvebu_pcie *pcie,
  1260		struct mvebu_pcie_port *port, struct device_node *child)
  1261	{
  1262		struct device *dev = &pcie->pdev->dev;
  1263		u32 slot_power_limit;
  1264		int ret;
  1265		u32 num_lanes;
  1266	
  1267		port->pcie = pcie;
  1268	
  1269		if (of_property_read_u32(child, "marvell,pcie-port", &port->port)) {
  1270			dev_warn(dev, "ignoring %pOF, missing pcie-port property\n",
  1271				 child);
  1272			goto skip;
  1273		}
  1274	
  1275		if (of_property_read_u32(child, "marvell,pcie-lane", &port->lane))
  1276			port->lane = 0;
  1277	
  1278		if (!of_property_read_u32(child, "num-lanes", &num_lanes) && num_lanes == 4)
  1279			port->is_x4 = true;
  1280	
  1281		port->name = devm_kasprintf(dev, GFP_KERNEL, "pcie%d.%d", port->port,
  1282					    port->lane);
  1283		if (!port->name) {
  1284			ret = -ENOMEM;
  1285			goto err;
  1286		}
  1287	
  1288		port->devfn = of_pci_get_devfn(child);
  1289		if (port->devfn < 0)
  1290			goto skip;
  1291		if (PCI_FUNC(port->devfn) != 0) {
  1292			dev_err(dev, "%s: invalid function number, must be zero\n",
  1293				port->name);
  1294			goto skip;
  1295		}
  1296	
  1297		ret = mvebu_get_tgt_attr(dev->of_node, port->devfn, IORESOURCE_MEM,
  1298					 &port->mem_target, &port->mem_attr);
  1299		if (ret < 0) {
  1300			dev_err(dev, "%s: cannot get tgt/attr for mem window\n",
  1301				port->name);
  1302			goto skip;
  1303		}
  1304	
  1305		if (resource_size(&pcie->io) != 0) {
  1306			mvebu_get_tgt_attr(dev->of_node, port->devfn, IORESOURCE_IO,
  1307					   &port->io_target, &port->io_attr);
  1308		} else {
  1309			port->io_target = -1;
  1310			port->io_attr = -1;
  1311		}
  1312	
  1313		/*
  1314		 * Old DT bindings do not contain "intx" interrupt
  1315		 * so do not fail probing driver when interrupt does not exist.
  1316		 */
  1317		port->intx_irq = of_irq_get_byname(child, "intx");
  1318		if (port->intx_irq == -EPROBE_DEFER) {
  1319			ret = port->intx_irq;
  1320			goto err;
  1321		}
  1322		if (port->intx_irq <= 0) {
  1323			dev_warn(dev, "%s: legacy INTx interrupts cannot be masked individually, "
  1324				      "%pOF does not contain intx interrupt\n",
  1325				 port->name, child);
  1326		}
  1327	
  1328		port->reset_name = devm_kasprintf(dev, GFP_KERNEL, "%s-reset",
  1329						  port->name);
  1330		if (!port->reset_name) {
  1331			ret = -ENOMEM;
  1332			goto err;
  1333		}
  1334	
  1335		port->reset_gpio = devm_fwnode_gpiod_get(dev, of_fwnode_handle(child),
  1336							 "reset", GPIOD_OUT_HIGH,
  1337							 port->name);
  1338		ret = PTR_ERR_OR_ZERO(port->reset_gpio);
  1339		if (ret) {
  1340			if (ret != -ENOENT)
  1341				goto err;
  1342			/* reset gpio is optional */
  1343			port->reset_gpio = NULL;
> 1344			devm_kfree(port->reset_name);
  1345			port->reset_name = NULL;
  1346		}
  1347	
  1348		slot_power_limit = of_pci_get_slot_power_limit(child,
  1349					&port->slot_power_limit_value,
  1350					&port->slot_power_limit_scale);
  1351		if (slot_power_limit)
  1352			dev_info(dev, "%s: Slot power limit %u.%uW\n",
  1353				 port->name,
  1354				 slot_power_limit / 1000,
  1355				 (slot_power_limit / 100) % 10);
  1356	
  1357		port->clk = of_clk_get_by_name(child, NULL);
  1358		if (IS_ERR(port->clk)) {
  1359			dev_err(dev, "%s: cannot get clock\n", port->name);
  1360			goto skip;
  1361		}
  1362	
  1363		ret = devm_add_action(dev, mvebu_pcie_port_clk_put, port);
  1364		if (ret < 0) {
  1365			clk_put(port->clk);
  1366			goto err;
  1367		}
  1368	
  1369		return 1;
  1370	
  1371	skip:
  1372		ret = 0;
  1373	
  1374		/* In the case of skipping, we need to free these */
  1375		devm_kfree(dev, port->reset_name);
  1376		port->reset_name = NULL;
  1377		devm_kfree(dev, port->name);
  1378		port->name = NULL;
  1379	
  1380	err:
  1381		return ret;
  1382	}
  1383	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
