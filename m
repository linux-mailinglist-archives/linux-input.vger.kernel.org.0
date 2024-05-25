Return-Path: <linux-input+bounces-3836-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A8D8CF0A8
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 19:55:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BCE31C20E38
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2024 17:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295A81272A5;
	Sat, 25 May 2024 17:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sws+lOCL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE93126F36;
	Sat, 25 May 2024 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716659700; cv=none; b=mYbXE7M3/WvHaMgGCb3QXlKSewtXqIxeuNrrDaLlxcpzqWHoBnBtGGYnbSTvzVCx6vfAdNfJVXV2KZPTGgvV62ejwbGGeetE/vHChQ74lsWy7tC0BjVSfLtRUqvY7oC0hua45dGRb6RHh81iSYjM5m+IuxyecNrxPlTneA5qukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716659700; c=relaxed/simple;
	bh=Jd/YXbOp7bDleAaAJrkInN1BmayRiHgY6ko8FIEMd2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecjvDhmXSp07J5R+CbyhX4G0a/8sekZLEtWvWjR2ibdbQfNtXH0qi4cWuHQX4yZSe874f5XLEigPcczyNbWSkFh5RJzsrFNfMNVBKGTWFDEYGgMbvLqo8+bqM94EMcUZvrTMZB8qSObADMeJXNqJi4AE0nJPciNX1niSrk3gmPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sws+lOCL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716659698; x=1748195698;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jd/YXbOp7bDleAaAJrkInN1BmayRiHgY6ko8FIEMd2k=;
  b=Sws+lOCLqJyj6Vup+e/9WdXyrSyWD0ltmHBP7xErKjAma0CzoqsnBSp4
   +53J94IfDs+l/l9sv4gAfLVCFJdLlFvMEq26ggdGZex8ZUWS1r7lLYyQ3
   Bg1daQAhMLtwKBwvMJB6wUML7qduxZLfhvOHZfHddO6W1Egi3Lx2QVYPy
   CP/Pt21GKR23YIw0U1ii4fQFOOL98B68zCAyJDcPEPhUuSYbDFaCVNkkK
   FSjv1ybkAqotHAM15biCVkF7kfuTpS8s/7+gJWqctmif0c851Vamfr/dj
   IXmSDEN0skTn68wJCeiXx8Cc8HXWU9+BvrrwT9HXaippnVsoBBnslgtdz
   Q==;
X-CSE-ConnectionGUID: mYHT1G2iR0CKvX3HXicwwA==
X-CSE-MsgGUID: DupaQ6BFT5OByXDO3D1F2g==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="13139652"
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="13139652"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 10:54:58 -0700
X-CSE-ConnectionGUID: 0CG1QOKLR/ec7d1yuNEhzg==
X-CSE-MsgGUID: kN2mUmjGRoao5oDBHR//qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,188,1712646000"; 
   d="scan'208";a="65562076"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 May 2024 10:54:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAvbY-0007GZ-0x;
	Sat, 25 May 2024 17:54:52 +0000
Date: Sun, 26 May 2024 01:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Wang <charles.goodix@gmail.com>, jikos@kernel.org,
	bentiss@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, jingliang@chromium.org,
	hbarnor@chromium.org, dianders@chromium.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: Re: [PATCH] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <202405260107.h86sSMnm-lkp@intel.com>
References: <20240524103407.36861-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524103407.36861-1-charles.goodix@gmail.com>

Hi Charles,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.9 next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Charles-Wang/HID-hid-goodix-Add-Goodix-HID-over-SPI-driver/20240524-183743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/20240524103407.36861-1-charles.goodix%40gmail.com
patch subject: [PATCH] HID: hid-goodix: Add Goodix HID-over-SPI driver
config: alpha-randconfig-r112-20240525 (https://download.01.org/0day-ci/archive/20240526/202405260107.h86sSMnm-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240526/202405260107.h86sSMnm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260107.h86sSMnm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/hid-goodix.c:330:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] data_register @@
   drivers/hid/hid-goodix.c:330:40: sparse:     expected unsigned short [usertype] val
   drivers/hid/hid-goodix.c:330:40: sparse:     got restricted __le16 [usertype] data_register
>> drivers/hid/hid-goodix.c:337:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] cmd_register @@
   drivers/hid/hid-goodix.c:337:40: sparse:     expected unsigned short [usertype] val
   drivers/hid/hid-goodix.c:337:40: sparse:     got restricted __le16 [usertype] cmd_register
   drivers/hid/hid-goodix.c:403:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] data_register @@
   drivers/hid/hid-goodix.c:403:40: sparse:     expected unsigned short [usertype] val
   drivers/hid/hid-goodix.c:403:40: sparse:     got restricted __le16 [usertype] data_register
   drivers/hid/hid-goodix.c:413:40: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned short [usertype] val @@     got restricted __le16 [usertype] cmd_register @@
   drivers/hid/hid-goodix.c:413:40: sparse:     expected unsigned short [usertype] val
   drivers/hid/hid-goodix.c:413:40: sparse:     got restricted __le16 [usertype] cmd_register
>> drivers/hid/hid-goodix.c:496:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [addressable] [usertype] size @@     got unsigned short [usertype] @@
   drivers/hid/hid-goodix.c:496:24: sparse:     expected restricted __le16 [addressable] [usertype] size
   drivers/hid/hid-goodix.c:496:24: sparse:     got unsigned short [usertype]
>> drivers/hid/hid-goodix.c:498:22: sparse: sparse: restricted __le16 degrades to integer
   drivers/hid/hid-goodix.c:501:22: sparse: sparse: restricted __le16 degrades to integer
   drivers/hid/hid-goodix.c:509:42: sparse: sparse: restricted __le16 degrades to integer
   drivers/hid/hid-goodix.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +330 drivers/hid/hid-goodix.c

   286	
   287	/**
   288	 * goodix_hid_get_raw_report() - Process hidraw GET REPORT operation
   289	 * @hid: hid device instance
   290	 * @reportnum: Report ID
   291	 * @buf: Buffer for store the reprot date
   292	 * @len: Length fo reprot data
   293	 * @report_type: Report type
   294	 *
   295	 * The function for hid_ll_driver.get_raw_report to handle the HIDRAW ioctl
   296	 * get report request. The transmitted data follows the standard i2c-hid
   297	 * protocol with a specified header.
   298	 *
   299	 * Return: The length of the data in the buf on success, negative error code
   300	 */
   301	static int goodix_hid_get_raw_report(struct hid_device *hid,
   302					     unsigned char reportnum,
   303					     __u8 *buf, size_t len,
   304					     unsigned char report_type)
   305	{
   306		struct goodix_ts_data *ts = hid->driver_data;
   307		u8 tmp_buf[GOODIX_HID_MAX_INBUF_SIZE];
   308		int tx_len = 0, args_len = 0;
   309		int response_data_len;
   310		u8 args[3];
   311		int error;
   312	
   313		if (report_type == HID_OUTPUT_REPORT)
   314			return -EINVAL;
   315	
   316		if (reportnum == 3) {
   317			/* Get win8 signature data */
   318			error = goodix_spi_read(ts, GOODIX_HID_SIGN_ADDR, buf, len);
   319			if (error) {
   320				dev_err(ts->dev, "failed get win8 sign:%d", error);
   321				return -EINVAL;
   322			}
   323			return len;
   324		}
   325	
   326		if (reportnum >= 0x0F) {
   327			args[args_len++] = reportnum;
   328			reportnum = 0x0F;
   329		}
 > 330		put_unaligned_le16(ts->hid_desc.data_register, args + args_len);
   331		args_len += sizeof(ts->hid_desc.data_register);
   332	
   333		/* Clean 3 bytes of hid ack header data */
   334		memset(tmp_buf, 0, GOODIX_HID_ACK_HEADER_SIZE);
   335		tx_len += GOODIX_HID_ACK_HEADER_SIZE;
   336	
 > 337		put_unaligned_le16(ts->hid_desc.cmd_register, tmp_buf + tx_len);
   338		tx_len += sizeof(ts->hid_desc.cmd_register);
   339	
   340		tmp_buf[tx_len++] = ((report_type == HID_FEATURE_REPORT ? 0x03 : 0x01) << 4) | reportnum;
   341		tmp_buf[tx_len++] = GOODIX_HID_GET_REPORT_CMD;
   342	
   343		memcpy(tmp_buf + tx_len, args, args_len);
   344		tx_len += args_len;
   345	
   346		/* Step1: write report request info */
   347		error = goodix_spi_write(ts, GOODIX_HID_REPORT_ADDR, tmp_buf, tx_len);
   348		if (error) {
   349			dev_err(ts->dev, "failed send read feature cmd, %d", error);
   350			return error;
   351		}
   352	
   353		/* No need read response data */
   354		if (!len)
   355			return 0;
   356	
   357		/* Step2: check response data status */
   358		response_data_len = goodix_hid_check_ack_status(ts);
   359		if (response_data_len <= 0)
   360			return -EINVAL;
   361	
   362		/* Step3: read response data(skip 2bytes of hid pkg length) */
   363		error = goodix_spi_read(ts, GOODIX_REPORT_DATA_ADDR, buf,
   364					response_data_len - GOODIX_HID_PKG_LEN_SIZE);
   365		if (error) {
   366			dev_err(ts->dev, "failed read hid response data, %d", error);
   367			return error;
   368		}
   369	
   370		return response_data_len - GOODIX_HID_PKG_LEN_SIZE;
   371	}
   372	
   373	/**
   374	 * goodix_hid_set_raw_report() - process hidraw SET REPORT operation
   375	 * @hid: HID device
   376	 * @reportnum: Report ID
   377	 * @buf: Buffer for communication
   378	 * @len: Length of data in the buffer
   379	 * @report_type: Report type
   380	 *
   381	 * The function for hid_ll_driver.get_raw_report to handle the HIDRAW ioctl
   382	 * set report request. The transmitted data follows the standard i2c-hid
   383	 * protocol with a specified header.
   384	 *
   385	 * Return: The length of the data sent, negative error code on failure
   386	 */
   387	static int goodix_hid_set_raw_report(struct hid_device *hid,
   388					     unsigned char reportnum,
   389					     __u8 *buf, size_t len,
   390					     unsigned char report_type)
   391	{
   392		struct goodix_ts_data *ts = hid->driver_data;
   393		int tx_len = 0, args_len = 0;
   394		u8 tmp_buf[GOODIX_HID_MAX_INBUF_SIZE];
   395		u8 args[5];
   396		int error;
   397	
   398		if (reportnum >= 0x0F) {
   399			args[args_len++] = reportnum;
   400			reportnum = 0x0F;
   401		}
   402	
 > 403		put_unaligned_le16(ts->hid_desc.data_register, args + args_len);
   404		args_len += sizeof(ts->hid_desc.data_register);
   405	
   406		put_unaligned_le16(GOODIX_HID_PKG_LEN_SIZE + len, args + args_len);
   407		args_len += GOODIX_HID_PKG_LEN_SIZE;
   408	
   409		/* Clean 3 bytes of hid ack header data */
   410		memset(tmp_buf, 0, GOODIX_HID_ACK_HEADER_SIZE);
   411		tx_len += GOODIX_HID_ACK_HEADER_SIZE;
   412	
   413		put_unaligned_le16(ts->hid_desc.cmd_register, tmp_buf + tx_len);
   414		tx_len += sizeof(ts->hid_desc.cmd_register);
   415	
   416		tmp_buf[tx_len++] = ((report_type == HID_FEATURE_REPORT ? 0x03 : 0x02) << 4) | reportnum;
   417		tmp_buf[tx_len++] = GOODIX_HID_SET_REPORT_CMD;
   418	
   419		memcpy(tmp_buf + tx_len, args, args_len);
   420		tx_len += args_len;
   421	
   422		memcpy(tmp_buf + tx_len, buf, len);
   423		tx_len += len;
   424	
   425		error = goodix_spi_write(ts, GOODIX_HID_REPORT_ADDR, tmp_buf, tx_len);
   426		if (error) {
   427			dev_err(ts->dev, "failed send report %*ph", tx_len, tmp_buf);
   428			return error;
   429		}
   430		return len;
   431	}
   432	
   433	static int goodix_hid_raw_request(struct hid_device *hid,
   434					  unsigned char reportnum,
   435					  __u8 *buf, size_t len,
   436					  unsigned char rtype, int reqtype)
   437	{
   438		switch (reqtype) {
   439		case HID_REQ_GET_REPORT:
   440			return goodix_hid_get_raw_report(hid, reportnum, buf,
   441							 len, rtype);
   442		case HID_REQ_SET_REPORT:
   443			if (buf[0] != reportnum)
   444				return -EINVAL;
   445			return goodix_hid_set_raw_report(hid, reportnum, buf,
   446							 len, rtype);
   447		default:
   448			return -EIO;
   449		}
   450	
   451		return -EINVAL;
   452	}
   453	
   454	static struct hid_ll_driver goodix_hid_ll_driver = {
   455		.parse = goodix_hid_parse,
   456		.start = goodix_hid_start,
   457		.stop = goodix_hid_stop,
   458		.open = goodix_hid_open,
   459		.close = goodix_hid_close,
   460		.raw_request = goodix_hid_raw_request
   461	};
   462	
   463	static irqreturn_t goodix_hid_irq(int irq, void *data)
   464	{
   465		struct goodix_ts_data *ts = data;
   466		struct goodix_hid_report_event event;
   467		struct goodix_hid_report_package *pkg;
   468		int error;
   469	
   470		/*
   471		 * First, read buffer with space for header and coordinate package:
   472		 * - event header = 3 bytes
   473		 * - coordinate event = GOODIX_HID_COOR_PKG_LEN bytes
   474		 *
   475		 * If the data size info in the event header exceeds
   476		 * GOODIX_HID_COOR_PKG_LEN, it means that there are other packages
   477		 * besides the coordinate package.
   478		 */
   479		error = goodix_spi_read(ts, GOODIX_HID_REPORT_ADDR, (u8 *)&event,
   480					sizeof(event));
   481		if (error) {
   482			dev_err(ts->dev, "failed get coordinate data, %d", error);
   483			return IRQ_HANDLED;
   484		}
   485	
   486		/* Check coordinate data valid falg */
   487		if (event.hdr.flag != GOODIX_HID_REPORT_READY_FLAG) {
   488			dev_err(ts->dev, "invalid event flag 0x%x", event.hdr.flag);
   489			return IRQ_HANDLED;
   490		}
   491	
   492		pkg = (struct goodix_hid_report_package *)event.data;
   493		hid_input_report(ts->hid, HID_INPUT_REPORT, pkg->data,
   494				 le16_to_cpu(pkg->size) - GOODIX_HID_PKG_LEN_SIZE, 1);
   495	
 > 496		event.hdr.size = le16_to_cpu(event.hdr.size);
   497		/* Check if there are other packages */
 > 498		if (event.hdr.size <= GOODIX_HID_COOR_PKG_LEN)
   499			return IRQ_HANDLED;
   500	
   501		if (event.hdr.size - GOODIX_HID_COOR_PKG_LEN > sizeof(ts->xfer_buf)) {
   502			dev_err(ts->dev, "invalid package size, %d", event.hdr.size);
   503			return IRQ_HANDLED;
   504		}
   505	
   506		/* Read the package behind the coordinate data */
   507		error = goodix_spi_read(ts, GOODIX_HID_REPORT_ADDR + sizeof(event),
   508					ts->xfer_buf,
   509					event.hdr.size - GOODIX_HID_COOR_PKG_LEN);
   510		if (error) {
   511			dev_err(ts->dev, "failed read data, %d", error);
   512			return IRQ_HANDLED;
   513		}
   514	
   515		pkg = (struct goodix_hid_report_package *)ts->xfer_buf;
   516		hid_input_report(ts->hid, HID_INPUT_REPORT, pkg->data,
   517				 le16_to_cpu(pkg->size) - GOODIX_HID_PKG_LEN_SIZE, 1);
   518	
   519		return IRQ_HANDLED;
   520	}
   521	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

