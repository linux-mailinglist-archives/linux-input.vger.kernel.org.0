Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D15046D54B
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 15:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhLHOPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 09:15:21 -0500
Received: from mga01.intel.com ([192.55.52.88]:3118 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhLHOPV (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 09:15:21 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="261913302"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="261913302"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 06:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="462773797"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Dec 2021 06:11:45 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1muxfc-0000dU-Tx; Wed, 08 Dec 2021 14:11:44 +0000
Date:   Wed, 8 Dec 2021 22:10:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rajat Jain <rajatja@google.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] usb: core: enable remote wakeup function for usb
 controller
Message-ID: <202112082256.02orEkq6-lkp@intel.com>
References: <1638956391-20149-2-git-send-email-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638956391-20149-2-git-send-email-zhuyinbo@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Yinbo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on hid/for-next v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yinbo-Zhu/HID-usbhid-enable-remote-wakeup-function-for-usbhid-device/20211208-174035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: hexagon-randconfig-r045-20211207 (https://download.01.org/0day-ci/archive/20211208/202112082256.02orEkq6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e900e8c9eb7fd4fda123036095e7e7ec87439547
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yinbo-Zhu/HID-usbhid-enable-remote-wakeup-function-for-usbhid-device/20211208-174035
        git checkout e900e8c9eb7fd4fda123036095e7e7ec87439547
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/usb/core/hub.c:2550:10: error: implicit declaration of function 'usb_enable_remote_wakeup' [-Werror,-Wimplicit-function-declaration]
                           err = usb_enable_remote_wakeup(udev);
                                 ^
   1 error generated.


vim +/usb_enable_remote_wakeup +2550 drivers/usb/core/hub.c

  2488	
  2489	/**
  2490	 * usb_new_device - perform initial device setup (usbcore-internal)
  2491	 * @udev: newly addressed device (in ADDRESS state)
  2492	 *
  2493	 * This is called with devices which have been detected but not fully
  2494	 * enumerated.  The device descriptor is available, but not descriptors
  2495	 * for any device configuration.  The caller must have locked either
  2496	 * the parent hub (if udev is a normal device) or else the
  2497	 * usb_bus_idr_lock (if udev is a root hub).  The parent's pointer to
  2498	 * udev has already been installed, but udev is not yet visible through
  2499	 * sysfs or other filesystem code.
  2500	 *
  2501	 * This call is synchronous, and may not be used in an interrupt context.
  2502	 *
  2503	 * Only the hub driver or root-hub registrar should ever call this.
  2504	 *
  2505	 * Return: Whether the device is configured properly or not. Zero if the
  2506	 * interface was registered with the driver core; else a negative errno
  2507	 * value.
  2508	 *
  2509	 */
  2510	int usb_new_device(struct usb_device *udev)
  2511	{
  2512		struct usb_host_config *config;
  2513		int ncfg;
  2514		int err;
  2515	
  2516		if (udev->parent) {
  2517			/* Initialize non-root-hub device wakeup to disabled;
  2518			 * device (un)configuration controls wakeup capable
  2519			 * sysfs power/wakeup controls wakeup enabled/disabled
  2520			 */
  2521			device_init_wakeup(&udev->dev, 0);
  2522		}
  2523	
  2524		/* Tell the runtime-PM framework the device is active */
  2525		pm_runtime_set_active(&udev->dev);
  2526		pm_runtime_get_noresume(&udev->dev);
  2527		pm_runtime_use_autosuspend(&udev->dev);
  2528		pm_runtime_enable(&udev->dev);
  2529	
  2530		/* By default, forbid autosuspend for all devices.  It will be
  2531		 * allowed for hubs during binding.
  2532		 */
  2533		usb_disable_autosuspend(udev);
  2534	
  2535		err = usb_enumerate_device(udev);	/* Read descriptors */
  2536		if (err < 0)
  2537			goto fail;
  2538		dev_dbg(&udev->dev, "udev %d, busnum %d, minor = %d\n",
  2539				udev->devnum, udev->bus->busnum,
  2540				(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
  2541		/* export the usbdev device-node for libusb */
  2542		udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
  2543				(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
  2544	
  2545		for (ncfg = 0; ncfg < udev->descriptor.bNumConfigurations; ncfg++) {
  2546			config = &udev->config[ncfg];
  2547			if ((config->desc.bmAttributes & (1 << 5)) == 0)
  2548				break;
  2549			if (ncfg + 1 == udev->descriptor.bNumConfigurations) {
> 2550				err = usb_enable_remote_wakeup(udev);
  2551				if (err)
  2552					dev_dbg(&udev->dev,
  2553					      "won't remote wakeup, err %d\n", err);
  2554			}
  2555		}
  2556	
  2557		/* Tell the world! */
  2558		announce_device(udev);
  2559	
  2560		if (udev->serial)
  2561			add_device_randomness(udev->serial, strlen(udev->serial));
  2562		if (udev->product)
  2563			add_device_randomness(udev->product, strlen(udev->product));
  2564		if (udev->manufacturer)
  2565			add_device_randomness(udev->manufacturer,
  2566					      strlen(udev->manufacturer));
  2567	
  2568		device_enable_async_suspend(&udev->dev);
  2569	
  2570		/* check whether the hub or firmware marks this port as non-removable */
  2571		set_usb_port_removable(udev);
  2572	
  2573		/* Register the device.  The device driver is responsible
  2574		 * for configuring the device and invoking the add-device
  2575		 * notifier chain (used by usbfs and possibly others).
  2576		 */
  2577		err = device_add(&udev->dev);
  2578		if (err) {
  2579			dev_err(&udev->dev, "can't device_add, error %d\n", err);
  2580			goto fail;
  2581		}
  2582	
  2583		/* Create link files between child device and usb port device. */
  2584		if (udev->parent) {
  2585			struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);
  2586			int port1 = udev->portnum;
  2587			struct usb_port	*port_dev = hub->ports[port1 - 1];
  2588	
  2589			err = sysfs_create_link(&udev->dev.kobj,
  2590					&port_dev->dev.kobj, "port");
  2591			if (err)
  2592				goto fail;
  2593	
  2594			err = sysfs_create_link(&port_dev->dev.kobj,
  2595					&udev->dev.kobj, "device");
  2596			if (err) {
  2597				sysfs_remove_link(&udev->dev.kobj, "port");
  2598				goto fail;
  2599			}
  2600	
  2601			if (!test_and_set_bit(port1, hub->child_usage_bits))
  2602				pm_runtime_get_sync(&port_dev->dev);
  2603		}
  2604	
  2605		(void) usb_create_ep_devs(&udev->dev, &udev->ep0, udev);
  2606		usb_mark_last_busy(udev);
  2607		pm_runtime_put_sync_autosuspend(&udev->dev);
  2608		return err;
  2609	
  2610	fail:
  2611		usb_set_device_state(udev, USB_STATE_NOTATTACHED);
  2612		pm_runtime_disable(&udev->dev);
  2613		pm_runtime_set_suspended(&udev->dev);
  2614		return err;
  2615	}
  2616	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
