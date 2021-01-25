Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16E973047FF
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 20:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbhAZFxq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 00:53:46 -0500
Received: from mga03.intel.com ([134.134.136.65]:55653 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728177AbhAYMke (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 07:40:34 -0500
IronPort-SDR: j1VgekSxaOZ+EPPmlrqdfs81mi4A9WsD6rvnwetffHS+zgPZjh9Amon7o/a6JYOUXImjXJe3kL
 y6C8LnkFQWIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9874"; a="179796581"
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="gz'50?scan'50,208,50";a="179796581"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 04:36:22 -0800
IronPort-SDR: bfJkMmIKEZXmv1NwaZWYxWnQihtVS24szwGDAU8eekVxLHdaifViCv4Sx0G7nQ2hn9MhqnxadI
 8puWO/BYi/HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,373,1602572400"; 
   d="gz'50?scan'50,208,50";a="472279361"
Received: from lkp-server02.sh.intel.com (HELO 625d3a354f04) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2021 04:36:20 -0800
Received: from kbuild by 625d3a354f04 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1l416R-000084-Tr; Mon, 25 Jan 2021 12:36:19 +0000
Date:   Mon, 25 Jan 2021 20:35:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [input:next 2641/2648] drivers/input/touchscreen/iqs5xx.c:897:6:
 warning: variable 'error_bl' is used uninitialized whenever 'if' condition
 is true
Message-ID: <202101252010.Kygz6WMc-lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
head:   3bdffa8ffb45c4f217d31a9250e90432ac31b35e
commit: 2539da6677b6355e124b99d1dbe15eb1066f1d46 [2641/2648] Input: iqs5xx - preserve bootloader errors
config: s390-randconfig-r025-20210125 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 12d0753aca22896fda2cf76781b0ee0524d55065)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=2539da6677b6355e124b99d1dbe15eb1066f1d46
        git remote add input https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
        git fetch --no-tags input next
        git checkout 2539da6677b6355e124b99d1dbe15eb1066f1d46
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=s390 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/iqs5xx.c:897:6: warning: variable 'error_bl' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (error)
               ^~~~~
   drivers/input/touchscreen/iqs5xx.c:952:6: note: uninitialized use occurs here
           if (error_bl)
               ^~~~~~~~
   drivers/input/touchscreen/iqs5xx.c:897:2: note: remove the 'if' if its condition is always false
           if (error)
           ^~~~~~~~~~
   drivers/input/touchscreen/iqs5xx.c:886:21: note: initialize the variable 'error_bl' to silence this warning
           int error, error_bl;
                              ^
                               = 0
   1 warning generated.


vim +897 drivers/input/touchscreen/iqs5xx.c

7b5bb55d0dad859e Jeff LaBundy 2019-04-30  882  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  883  static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  884  {
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  885  	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
2539da6677b6355e Jeff LaBundy 2021-01-24  886  	int error, error_bl;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  887  	u8 *pmap;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  888  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  889  	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_NONE)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  890  		return -EPERM;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  891  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  892  	pmap = kzalloc(IQS5XX_PMAP_LEN, GFP_KERNEL);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  893  	if (!pmap)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  894  		return -ENOMEM;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  895  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  896  	error = iqs5xx_fw_file_parse(client, fw_file, pmap);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30 @897  	if (error)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  898  		goto err_kfree;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  899  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  900  	mutex_lock(&iqs5xx->lock);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  901  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  902  	/*
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  903  	 * Disable the interrupt line in case the first attempt(s) to enter the
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  904  	 * bootloader don't happen quickly enough, in which case the device may
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  905  	 * assert the RDY output until the next attempt.
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  906  	 */
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  907  	disable_irq(client->irq);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  908  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  909  	iqs5xx->bl_status = IQS5XX_BL_STATUS_RESET;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  910  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  911  	error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_VER, 0);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  912  	if (error) {
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  913  		error = iqs5xx_bl_open(client);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  914  		if (error)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  915  			goto err_reset;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  916  	}
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  917  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  918  	error = iqs5xx_bl_write(client, IQS5XX_CHKSM, pmap, IQS5XX_PMAP_LEN);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  919  	if (error)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  920  		goto err_reset;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  921  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  922  	error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_CRC, 0);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  923  	if (error)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  924  		goto err_reset;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  925  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  926  	error = iqs5xx_bl_verify(client, IQS5XX_CSTM,
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  927  				 pmap + IQS5XX_CHKSM_LEN + IQS5XX_APP_LEN,
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  928  				 IQS5XX_CSTM_LEN);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  929  	if (error)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  930  		goto err_reset;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  931  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  932  	error = iqs5xx_bl_cmd(client, IQS5XX_BL_CMD_EXEC, 0);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  933  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  934  err_reset:
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  935  	if (error) {
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  936  		iqs5xx_reset(client);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  937  		usleep_range(10000, 10100);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  938  	}
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  939  
2539da6677b6355e Jeff LaBundy 2021-01-24  940  	error_bl = error;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  941  	error = iqs5xx_dev_init(client);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  942  	if (!error && iqs5xx->bl_status == IQS5XX_BL_STATUS_RESET)
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  943  		error = -EINVAL;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  944  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  945  	enable_irq(client->irq);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  946  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  947  	mutex_unlock(&iqs5xx->lock);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  948  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  949  err_kfree:
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  950  	kfree(pmap);
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  951  
2539da6677b6355e Jeff LaBundy 2021-01-24  952  	if (error_bl)
2539da6677b6355e Jeff LaBundy 2021-01-24  953  		return error_bl;
2539da6677b6355e Jeff LaBundy 2021-01-24  954  
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  955  	return error;
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  956  }
7b5bb55d0dad859e Jeff LaBundy 2019-04-30  957  

:::::: The code at line 897 was first introduced by commit
:::::: 7b5bb55d0dad859ee5bb41b1664e2ac577378c38 Input: add support for Azoteq IQS550/572/525

:::::: TO: Jeff LaBundy <jeff@labundy.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--YZ5djTAD1cGYuMQK
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
/wMtad/w+9gAAA==

--YZ5djTAD1cGYuMQK--
