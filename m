Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F801CCAA9
	for <lists+linux-input@lfdr.de>; Sun, 10 May 2020 14:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726955AbgEJMEJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 May 2020 08:04:09 -0400
Received: from mga05.intel.com ([192.55.52.43]:40304 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbgEJMEJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 May 2020 08:04:09 -0400
IronPort-SDR: ZoRVd+ZU1iUdYWyXE9ySfGYVuRkGuNPZkFqk1dCFhYw9gtq8ZJ3wVsN5vxvD+e1SCy/APO9A3g
 9QFTOAkLd7KQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2020 05:04:08 -0700
IronPort-SDR: HqL5CisKaYq2I6Fp9GazTuvweKAxIMGw+8WFPB2/v97nU4vimulV8CGnQBYkKzU74/sXCHMkdU
 f2pL2UmzJFLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,375,1583222400"; 
   d="scan'208";a="279513234"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 10 May 2020 05:04:03 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jXkgc-0005Ey-UN; Sun, 10 May 2020 20:04:02 +0800
Date:   Sun, 10 May 2020 20:03:11 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     kbuild-all@lists.01.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, erosca@de.adit-jv.com,
        Andrew_Gabbasov@mentor.com, jiada_wang@mentor.com
Subject: Re: [PATCH v11 54/56] input: atmel_mxt_ts: added sysfs interface to
 update atmel T38 data
Message-ID: <202005101947.mMD4gvx7%lkp@intel.com>
References: <20200508055656.96389-55-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508055656.96389-55-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiada,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on xen-tip/linux-next robh/for-next linus/master v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jiada-Wang/atmel_mxt_ts-misc/20200509-031552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/input/touchscreen/atmel_mxt_ts.c:4045:8: warning: %d in format string (no. 2) requires 'int *' but the argument type is 'unsigned int *'. [invalidScanfArgType_int]
    ret = sscanf(buf, "%zd %d%zd", &offset, &len, &pos);
          ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1993:20: warning: Unsigned expression 'byte_offset' can't be negative so it is unnecessary to test it. [unsignedPositive]
      if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
                      ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1024:33: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_RESET ? " RESET" : "",
                                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1025:31: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_OFL ? " OFL" : "",
                                 ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1026:34: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_SIGERR ? " SIGERR" : "",
                                    ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1027:31: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_CAL ? " CAL" : "",
                                 ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1028:34: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_CFGERR ? " CFGERR" : "",
                                    ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1029:35: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
      status & MXT_T6_STATUS_COMSERR ? " COMSERR" : "");
                                     ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1346:17: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x01 ? "FREQCHG " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1347:17: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x02 ? "APXCHG " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1348:17: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x04 ? "ALGOERR " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1349:17: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x10 ? "STATCHG " : "",
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:1350:17: warning: Clarify calculation precedence for '&' and '?'. [clarifyCalculation]
     status & 0x20 ? "NLVLCHG " : "");
                   ^
   drivers/input/touchscreen/atmel_mxt_ts.c:274:20: warning: struct member 'mxt_dbg::t37_buf' is never used. [unusedStructMember]
    struct t37_debug *t37_buf;
                      ^
   drivers/input/touchscreen/atmel_mxt_ts.c:275:15: warning: struct member 'mxt_dbg::t37_pages' is never used. [unusedStructMember]
    unsigned int t37_pages;
                 ^
   drivers/input/touchscreen/atmel_mxt_ts.c:276:15: warning: struct member 'mxt_dbg::t37_nodes' is never used. [unusedStructMember]
    unsigned int t37_nodes;

vim +4045 drivers/input/touchscreen/atmel_mxt_ts.c

  4024	
  4025	static ssize_t t38_data_store(struct device *dev,
  4026				      struct device_attribute *attr,
  4027				      const char *buf, size_t count)
  4028	{
  4029		struct mxt_data *data = dev_get_drvdata(dev);
  4030		struct mxt_object *object;
  4031		ssize_t ret = 0, pos, offset;
  4032		unsigned int i, len, index;
  4033		u8 *t38_buf;
  4034	
  4035		if (!data->object_table)
  4036			return -ENXIO;
  4037	
  4038		object = mxt_get_object(data, MXT_SPT_USERDATA_T38);
  4039	
  4040		/* Pre-allocate buffer large enough to hold max size of t38 object.*/
  4041		t38_buf = kmalloc(mxt_obj_size(object), GFP_KERNEL);
  4042		if (!t38_buf)
  4043			return -ENOMEM;
  4044	
> 4045		ret = sscanf(buf, "%zd %d%zd", &offset, &len, &pos);
  4046		if (ret != 2) {
  4047			dev_err(dev, "Bad format: Invalid parameter to update t38\n");
  4048			ret = -EINVAL;
  4049			goto end;
  4050		}
  4051	
  4052		if (len == 0) {
  4053			dev_err(dev,
  4054				"Bad format: Data length should not be equal to 0\n");
  4055			ret = -EINVAL;
  4056			goto end;
  4057		}
  4058	
  4059		if (offset < 0 || ((offset + len) > 64)) {
  4060			dev_err(dev, "Invalid offset value to update t38\n");
  4061			ret = -EINVAL;
  4062			goto end;
  4063		}
  4064	
  4065		index = pos;
  4066		for (i = 0; i < len; i++) {
  4067			ret = sscanf(buf + index, "%hhx%zd", t38_buf + i, &pos);
  4068			if (ret != 1) {
  4069				dev_err(dev, "Bad format: Invalid Data\n");
  4070				ret = -EINVAL;
  4071				goto end;
  4072			}
  4073			index += pos;
  4074		}
  4075	
  4076		ret = __mxt_write_reg(data->client, object->start_address + offset,
  4077				      len, t38_buf);
  4078		if (ret)
  4079			goto end;
  4080	
  4081		ret = mxt_t6_command(data, MXT_COMMAND_BACKUPNV, MXT_BACKUP_VALUE,
  4082				     true);
  4083		if (ret)
  4084			dev_err(dev, "backup command failed\n");
  4085		else
  4086			ret = count;
  4087	end:
  4088		kfree(t38_buf);
  4089		return ret;
  4090	}
  4091	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
