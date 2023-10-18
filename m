Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79B2A7CEB11
	for <lists+linux-input@lfdr.de>; Thu, 19 Oct 2023 00:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbjJRWRi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Oct 2023 18:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231513AbjJRWRh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Oct 2023 18:17:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A696120;
        Wed, 18 Oct 2023 15:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697667453; x=1729203453;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z3IIJfbvuEma13Urz3y6LBWe3hMdSfJB7K0I1h7YR0E=;
  b=Z8uUmIviQSSMFh95oYHXDi03MrVEoeVGjyAEADwcmLWe0Vh/6TZamhrJ
   57eQqTa6nrSNnvJ/BrV10odqmdoNRpajs+ax5MWjpCDJjNixBnrOT3HrF
   fkvfNbumUC6TfNgu0cVb372Pgx6pEpTFhJh+elYDoJVQkjrkaN6U36pEX
   b/gcp1R06pyuuPCcZFPUSHnDz6L6iC6AY9Lcoba5ncLXV0EXHtCToDnr6
   PNkoaj/mcUrV/MG8rTl9IyG3XUQaphPQzHOPTv9IATvj7mouc9ePhSBZ0
   pKcNM9K3iEFp1c9cIGs3evsPsKosorYPNFmgNsqeiAnJpiP+LDgVJDAt6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="388987166"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="388987166"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 15:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="827090382"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="827090382"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Oct 2023 15:17:29 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qtEr1-00019g-20;
        Wed, 18 Oct 2023 22:17:27 +0000
Date:   Thu, 19 Oct 2023 06:17:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>
Subject: Re: [PATCH v2 7/7] Input: synaptics-rmi4 - support fallback values
 for PDT descriptor bytes
Message-ID: <202310190640.pxJQCbWc-lkp@intel.com>
References: <20230929-caleb-rmi4-quirks-v2-7-b227ac498d88@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-caleb-rmi4-quirks-v2-7-b227ac498d88@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Caleb,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.6-rc6 next-20231018]
[cannot apply to dtor-input/next dtor-input/for-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-Connolly/Input-synaptics-rmi4-handle-duplicate-unknown-PDT-entries/20231017-132844
base:   linus/master
patch link:    https://lore.kernel.org/r/20230929-caleb-rmi4-quirks-v2-7-b227ac498d88%40linaro.org
patch subject: [PATCH v2 7/7] Input: synaptics-rmi4 - support fallback values for PDT descriptor bytes
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231019/202310190640.pxJQCbWc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190640.pxJQCbWc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190640.pxJQCbWc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/rmi4/rmi_driver.c:1223:32: error: incompatible pointer types passing 'struct rmi_device *' to parameter of type 'struct device *' [-Werror,-Wincompatible-pointer-types]
                   retval = rmi_driver_of_probe(rmi_dev, pdata);
                                                ^~~~~~~
   drivers/input/rmi4/rmi_driver.c:1101:54: note: passing argument to parameter 'dev' here
   static inline int rmi_driver_of_probe(struct device *dev,
                                                        ^
   1 error generated.


vim +1223 drivers/input/rmi4/rmi_driver.c

  1199	
  1200	static int rmi_driver_probe(struct device *dev)
  1201	{
  1202		struct rmi_driver *rmi_driver;
  1203		struct rmi_driver_data *data;
  1204		struct rmi_device_platform_data *pdata;
  1205		struct rmi_device *rmi_dev;
  1206		int retval;
  1207	
  1208		rmi_dbg(RMI_DEBUG_CORE, dev, "%s: Starting probe.\n",
  1209				__func__);
  1210	
  1211		if (!rmi_is_physical_device(dev)) {
  1212			rmi_dbg(RMI_DEBUG_CORE, dev, "Not a physical device.\n");
  1213			return -ENODEV;
  1214		}
  1215	
  1216		rmi_dev = to_rmi_device(dev);
  1217		rmi_driver = to_rmi_driver(dev->driver);
  1218		rmi_dev->driver = rmi_driver;
  1219	
  1220		pdata = rmi_get_platform_data(rmi_dev);
  1221	
  1222		if (rmi_dev->xport->dev->of_node) {
> 1223			retval = rmi_driver_of_probe(rmi_dev, pdata);
  1224			if (retval)
  1225				return retval;
  1226		}
  1227	
  1228		data = devm_kzalloc(dev, sizeof(struct rmi_driver_data), GFP_KERNEL);
  1229		if (!data)
  1230			return -ENOMEM;
  1231	
  1232		INIT_LIST_HEAD(&data->function_list);
  1233		data->rmi_dev = rmi_dev;
  1234		dev_set_drvdata(&rmi_dev->dev, data);
  1235	
  1236		/*
  1237		 * Right before a warm boot, the sensor might be in some unusual state,
  1238		 * such as F54 diagnostics, or F34 bootloader mode after a firmware
  1239		 * or configuration update.  In order to clear the sensor to a known
  1240		 * state and/or apply any updates, we issue a initial reset to clear any
  1241		 * previous settings and force it into normal operation.
  1242		 *
  1243		 * We have to do this before actually building the PDT because
  1244		 * the reflash updates (if any) might cause various registers to move
  1245		 * around.
  1246		 *
  1247		 * For a number of reasons, this initial reset may fail to return
  1248		 * within the specified time, but we'll still be able to bring up the
  1249		 * driver normally after that failure.  This occurs most commonly in
  1250		 * a cold boot situation (where then firmware takes longer to come up
  1251		 * than from a warm boot) and the reset_delay_ms in the platform data
  1252		 * has been set too short to accommodate that.  Since the sensor will
  1253		 * eventually come up and be usable, we don't want to just fail here
  1254		 * and leave the customer's device unusable.  So we warn them, and
  1255		 * continue processing.
  1256		 */
  1257		retval = rmi_scan_pdt(rmi_dev, NULL, rmi_initial_reset);
  1258		if (retval < 0)
  1259			dev_warn(dev, "RMI initial reset failed! Continuing in spite of this.\n");
  1260	
  1261		retval = rmi_read(rmi_dev, PDT_PROPERTIES_LOCATION, &data->pdt_props);
  1262		if (retval < 0) {
  1263			/*
  1264			 * we'll print out a warning and continue since
  1265			 * failure to get the PDT properties is not a cause to fail
  1266			 */
  1267			dev_warn(dev, "Could not read PDT properties from %#06x (code %d). Assuming 0x00.\n",
  1268				 PDT_PROPERTIES_LOCATION, retval);
  1269		}
  1270	
  1271		mutex_init(&data->irq_mutex);
  1272		mutex_init(&data->enabled_mutex);
  1273	
  1274		retval = rmi_probe_interrupts(data);
  1275		if (retval)
  1276			goto err;
  1277	
  1278		if (rmi_dev->xport->input) {
  1279			/*
  1280			 * The transport driver already has an input device.
  1281			 * In some cases it is preferable to reuse the transport
  1282			 * devices input device instead of creating a new one here.
  1283			 * One example is some HID touchpads report "pass-through"
  1284			 * button events are not reported by rmi registers.
  1285			 */
  1286			data->input = rmi_dev->xport->input;
  1287		} else {
  1288			data->input = devm_input_allocate_device(dev);
  1289			if (!data->input) {
  1290				dev_err(dev, "%s: Failed to allocate input device.\n",
  1291					__func__);
  1292				retval = -ENOMEM;
  1293				goto err;
  1294			}
  1295			rmi_driver_set_input_params(rmi_dev, data->input);
  1296			data->input->phys = devm_kasprintf(dev, GFP_KERNEL,
  1297							"%s/input0", dev_name(dev));
  1298		}
  1299	
  1300		retval = rmi_init_functions(data);
  1301		if (retval)
  1302			goto err;
  1303	
  1304		retval = rmi_f34_create_sysfs(rmi_dev);
  1305		if (retval)
  1306			goto err;
  1307	
  1308		if (data->input) {
  1309			rmi_driver_set_input_name(rmi_dev, data->input);
  1310			if (!rmi_dev->xport->input) {
  1311				retval = input_register_device(data->input);
  1312				if (retval) {
  1313					dev_err(dev, "%s: Failed to register input device.\n",
  1314						__func__);
  1315					goto err_destroy_functions;
  1316				}
  1317			}
  1318		}
  1319	
  1320		retval = rmi_irq_init(rmi_dev);
  1321		if (retval < 0)
  1322			goto err_destroy_functions;
  1323	
  1324		if (data->f01_container->dev.driver) {
  1325			/* Driver already bound, so enable ATTN now. */
  1326			retval = rmi_enable_sensor(rmi_dev);
  1327			if (retval)
  1328				goto err_disable_irq;
  1329		}
  1330	
  1331		return 0;
  1332	
  1333	err_disable_irq:
  1334		rmi_disable_irq(rmi_dev, false);
  1335	err_destroy_functions:
  1336		rmi_free_function_list(rmi_dev);
  1337	err:
  1338		return retval;
  1339	}
  1340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
