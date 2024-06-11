Return-Path: <linux-input+bounces-4309-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D07903933
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 12:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4BBB1F24B71
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 10:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39893178395;
	Tue, 11 Jun 2024 10:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBd2tuLi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2559B174ED1
	for <linux-input@vger.kernel.org>; Tue, 11 Jun 2024 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718102822; cv=none; b=k8omgyko6jekg6ALgpaOEk/n5L2CDjCDJ1ugidaYK7ct0TROocDCcT80YR4s1lYOEqn8XBLvLNSF2d/C6yUBHPdYJ8/FmKdFyEiUOPwP73MTitQoCwiS3/9F5XkbP9HUAa0RPaY3g2w/+ZO9aXF6IMQySVLYu9EvMN6QLWR0Xqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718102822; c=relaxed/simple;
	bh=9v70XV5y4GSnRmoIx0HSZWYeUnRaDfB3X/utGcfIfWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JPK0Er4iNAGmHlKc/FXELkbWr+gSoBiLbAHugqfeZRUJNpHAnNsRqzmz7uHt1sXNdEmRHWpOkbf7RSLAJb/g0jVcyz0dfPmB5kA5S2JIQBUPAOrAe6ecUletk7MHAZxpfeKfLQIyhZR1FZSkxILFlo27MeXr/5E3i8wfLL8nwrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBd2tuLi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso6075332e87.3
        for <linux-input@vger.kernel.org>; Tue, 11 Jun 2024 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718102818; x=1718707618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fp+D+Ajoxcp8Oj4mR/rcn2WCT+/k1rl0VG3rX/u5T2Q=;
        b=MBd2tuLiHRwAKtrcqn9GqsnRRNl3nrk6DUSuECUgfdDdXs8CG2ngPxcUVTuULh/VsR
         eu1bY+Tg+Anpxr0qgbd/+lFcv9+CLE6xeQZsI9ak0b15SyaObL8qb6JHRrw79JLQyPsk
         LMR/XhZPAKVSANmvgzcMU8+7waP+WcpyLS01Zw9InGh9wF3E5OdzEpqOwiTtX/w3sLL7
         Kc3XwCawSfVY1jlJEfCzOjhzRiLaGNWXJhtPZuFupMoZmQXf8BX8+0SmAhdGqq5teMvF
         5V/hMwgf/a4l/xavhZrd+UhkCbXNNmp60UD5Kb+mVJhmibuBuQz0Mj2bLfeQagFH92u8
         3tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718102818; x=1718707618;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fp+D+Ajoxcp8Oj4mR/rcn2WCT+/k1rl0VG3rX/u5T2Q=;
        b=eN8wjUiDQMQYgPkmlQ67t2+QlEyZiTkfTR55tpN3WIiSIPnHzKpUjnU9Kc3RplJYWN
         WIIS3CVflDL3jQTEIP+wYvIxdtBL1RxSSCI5Q7Mc++iQ5njZFMuc1ratKZAOEp6Md+PR
         MSkTFLXwgiSLkuPUnAaKdi63GJNwC+4CIaunna1hWENpNICT8uKaVvZ5YR3xTCfDr6EM
         rdANXfJlvtW7dERoeXj6RQf9x/XOnghd0ckcdMj5q9nqZH/oMz+g7hYF35nNYPGNShEr
         esuIh/dKndihs/3ZnQ0WYl1I5xZ1fWzwEy+LTpsMhHSAIKFYy7EEM4THuWTtmtJii53q
         nWGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeSEaLC2291Jxt7LJ6roQXvjpYZG6592F8dwy674ZZE5e8xWId5iv2q9Vl3GpP7lbSlrOMUJYaAFd9l1JeSa3Af2VGeyNZcinJiEQ=
X-Gm-Message-State: AOJu0Yz099f41xrZxAO1T8LcS1s09Lfh++czmz++IDmgK+bjgLW1Zawc
	5bKIpXv0biGeBw6Zdl6kuVF8fWufPRyCwKEHL/lCkEiQhP6uD1wrL8UVrxU50b0=
X-Google-Smtp-Source: AGHT+IHtdFqo/9J5gcont3xPpGuqzTIC4OsBhAx07391LfaeWl+GPgTqM/ZWZg+Gl6i65g9CyLwSng==
X-Received: by 2002:a05:6512:318e:b0:52c:9528:55d1 with SMTP id 2adb3069b0e04-52c952856f6mr1061801e87.4.1718102818138;
        Tue, 11 Jun 2024 03:46:58 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f2583bdedsm4755135f8f.72.2024.06.11.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 03:46:57 -0700 (PDT)
Date: Tue, 11 Jun 2024 13:46:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macromorgan@hotmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adc-joystick - move axes data into the main
 structure
Message-ID: <0c098606-aba1-4cc0-9a33-6a68c67b1157@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmYlfKDm5sgB44EU@google.com>

Hi Dmitry,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Torokhov/Input-adc-joystick-move-axes-data-into-the-main-structure/20240610-060124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/ZmYlfKDm5sgB44EU%40google.com
patch subject: [PATCH] Input: adc-joystick - move axes data into the main structure
config: x86_64-randconfig-161-20240611 (https://download.01.org/0day-ci/archive/20240611/202406111750.AXBfJUS3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202406111750.AXBfJUS3-lkp@intel.com/

smatch warnings:
drivers/input/joystick/adc-joystick.c:166 adc_joystick_set_axes() error: uninitialized symbol 'axes'.
drivers/input/joystick/adc-joystick.c:241 adc_joystick_probe() error: uninitialized symbol 'joy'.
drivers/input/joystick/adc-joystick.c:241 adc_joystick_probe() warn: passing zero to 'PTR_ERR'

vim +/axes +166 drivers/input/joystick/adc-joystick.c

2c2b364fddd551 Artur Rojek     2020-09-28  131  
2c2b364fddd551 Artur Rojek     2020-09-28  132  static int adc_joystick_set_axes(struct device *dev, struct adc_joystick *joy)
2c2b364fddd551 Artur Rojek     2020-09-28  133  {
2c2b364fddd551 Artur Rojek     2020-09-28  134  	struct adc_joystick_axis *axes;
2c2b364fddd551 Artur Rojek     2020-09-28  135  	struct fwnode_handle *child;
815b74328f141f Dmitry Torokhov 2024-06-09  136  	s32 range[2], fuzz, flat;
815b74328f141f Dmitry Torokhov 2024-06-09  137  	unsigned int num_axes;
815b74328f141f Dmitry Torokhov 2024-06-09  138  	int error, i;
2c2b364fddd551 Artur Rojek     2020-09-28  139  
2c2b364fddd551 Artur Rojek     2020-09-28  140  	num_axes = device_get_child_node_count(dev);
2c2b364fddd551 Artur Rojek     2020-09-28  141  	if (!num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  142  		dev_err(dev, "Unable to find child nodes\n");
2c2b364fddd551 Artur Rojek     2020-09-28  143  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  144  	}
2c2b364fddd551 Artur Rojek     2020-09-28  145  
2c2b364fddd551 Artur Rojek     2020-09-28  146  	if (num_axes != joy->num_chans) {
2c2b364fddd551 Artur Rojek     2020-09-28  147  		dev_err(dev, "Got %d child nodes for %d channels\n",
2c2b364fddd551 Artur Rojek     2020-09-28  148  			num_axes, joy->num_chans);
2c2b364fddd551 Artur Rojek     2020-09-28  149  		return -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  150  	}
2c2b364fddd551 Artur Rojek     2020-09-28  151  
2c2b364fddd551 Artur Rojek     2020-09-28  152  	device_for_each_child_node(dev, child) {
2c2b364fddd551 Artur Rojek     2020-09-28  153  		error = fwnode_property_read_u32(child, "reg", &i);
2c2b364fddd551 Artur Rojek     2020-09-28  154  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  155  			dev_err(dev, "reg invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  156  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  157  		}
2c2b364fddd551 Artur Rojek     2020-09-28  158  
2c2b364fddd551 Artur Rojek     2020-09-28  159  		if (i >= num_axes) {
2c2b364fddd551 Artur Rojek     2020-09-28  160  			error = -EINVAL;
2c2b364fddd551 Artur Rojek     2020-09-28  161  			dev_err(dev, "No matching axis for reg %d\n", i);
2c2b364fddd551 Artur Rojek     2020-09-28  162  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  163  		}
2c2b364fddd551 Artur Rojek     2020-09-28  164  
2c2b364fddd551 Artur Rojek     2020-09-28  165  		error = fwnode_property_read_u32(child, "linux,code",
2c2b364fddd551 Artur Rojek     2020-09-28 @166  						 &axes[i].code);

axes is unitialized.

2c2b364fddd551 Artur Rojek     2020-09-28  167  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  168  			dev_err(dev, "linux,code invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  169  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  170  		}
2c2b364fddd551 Artur Rojek     2020-09-28  171  
2c2b364fddd551 Artur Rojek     2020-09-28  172  		error = fwnode_property_read_u32_array(child, "abs-range",
815b74328f141f Dmitry Torokhov 2024-06-09  173  						       range, 2);
2c2b364fddd551 Artur Rojek     2020-09-28  174  		if (error) {
2c2b364fddd551 Artur Rojek     2020-09-28  175  			dev_err(dev, "abs-range invalid or missing\n");
2c2b364fddd551 Artur Rojek     2020-09-28  176  			goto err_fwnode_put;
2c2b364fddd551 Artur Rojek     2020-09-28  177  		}
2c2b364fddd551 Artur Rojek     2020-09-28  178  
815b74328f141f Dmitry Torokhov 2024-06-09  179  		if (range[0] > range[1]) {
6560cfcfb46511 Chris Morgan    2024-01-19  180  			dev_dbg(dev, "abs-axis %d inverted\n", i);
6560cfcfb46511 Chris Morgan    2024-01-19  181  			axes[i].inverted = true;
815b74328f141f Dmitry Torokhov 2024-06-09  182  			swap(range[0], range[1]);
6560cfcfb46511 Chris Morgan    2024-01-19  183  		}
6560cfcfb46511 Chris Morgan    2024-01-19  184  
815b74328f141f Dmitry Torokhov 2024-06-09  185  		fwnode_property_read_u32(child, "abs-fuzz", &fuzz);
815b74328f141f Dmitry Torokhov 2024-06-09  186  		fwnode_property_read_u32(child, "abs-flat", &flat);
2c2b364fddd551 Artur Rojek     2020-09-28  187  
2c2b364fddd551 Artur Rojek     2020-09-28  188  		input_set_abs_params(joy->input, axes[i].code,
815b74328f141f Dmitry Torokhov 2024-06-09  189  				     range[0], range[1], fuzz, flat);
2c2b364fddd551 Artur Rojek     2020-09-28  190  	}
2c2b364fddd551 Artur Rojek     2020-09-28  191  
2c2b364fddd551 Artur Rojek     2020-09-28  192  	return 0;
2c2b364fddd551 Artur Rojek     2020-09-28  193  
2c2b364fddd551 Artur Rojek     2020-09-28  194  err_fwnode_put:
2c2b364fddd551 Artur Rojek     2020-09-28  195  	fwnode_handle_put(child);
2c2b364fddd551 Artur Rojek     2020-09-28  196  	return error;
2c2b364fddd551 Artur Rojek     2020-09-28  197  }
2c2b364fddd551 Artur Rojek     2020-09-28  198  
815b74328f141f Dmitry Torokhov 2024-06-09  199  
815b74328f141f Dmitry Torokhov 2024-06-09  200  /*
815b74328f141f Dmitry Torokhov 2024-06-09  201   * Count how many channels we got. NULL terminated.
815b74328f141f Dmitry Torokhov 2024-06-09  202   * Do not check the storage size if using polling.
815b74328f141f Dmitry Torokhov 2024-06-09  203   */
815b74328f141f Dmitry Torokhov 2024-06-09  204  static int adc_joystick_count_channels(struct device *dev,
815b74328f141f Dmitry Torokhov 2024-06-09  205  				       const struct iio_channel *chans,
815b74328f141f Dmitry Torokhov 2024-06-09  206  				       bool polled,
815b74328f141f Dmitry Torokhov 2024-06-09  207  				       unsigned int *num_chans)
815b74328f141f Dmitry Torokhov 2024-06-09  208  {
815b74328f141f Dmitry Torokhov 2024-06-09  209  	int bits;
815b74328f141f Dmitry Torokhov 2024-06-09  210  	int i;
815b74328f141f Dmitry Torokhov 2024-06-09  211  
815b74328f141f Dmitry Torokhov 2024-06-09  212  	for (i = 0; chans[i].indio_dev; i++) {
815b74328f141f Dmitry Torokhov 2024-06-09  213  		if (polled)
815b74328f141f Dmitry Torokhov 2024-06-09  214  			continue;
815b74328f141f Dmitry Torokhov 2024-06-09  215  		bits = chans[i].channel->scan_type.storagebits;
815b74328f141f Dmitry Torokhov 2024-06-09  216  		if (!bits || bits > 16) {
815b74328f141f Dmitry Torokhov 2024-06-09  217  			dev_err(dev, "Unsupported channel storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  218  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  219  		}
815b74328f141f Dmitry Torokhov 2024-06-09  220  		if (bits != chans[0].channel->scan_type.storagebits) {
815b74328f141f Dmitry Torokhov 2024-06-09  221  			dev_err(dev, "Channels must have equal storage size\n");
815b74328f141f Dmitry Torokhov 2024-06-09  222  			return -EINVAL;
815b74328f141f Dmitry Torokhov 2024-06-09  223  		}
815b74328f141f Dmitry Torokhov 2024-06-09  224  	}
815b74328f141f Dmitry Torokhov 2024-06-09  225  
815b74328f141f Dmitry Torokhov 2024-06-09  226  	return i;
815b74328f141f Dmitry Torokhov 2024-06-09  227  }
815b74328f141f Dmitry Torokhov 2024-06-09  228  
2c2b364fddd551 Artur Rojek     2020-09-28  229  static int adc_joystick_probe(struct platform_device *pdev)
2c2b364fddd551 Artur Rojek     2020-09-28  230  {
2c2b364fddd551 Artur Rojek     2020-09-28  231  	struct device *dev = &pdev->dev;
815b74328f141f Dmitry Torokhov 2024-06-09  232  	struct iio_channel *chans;
2c2b364fddd551 Artur Rojek     2020-09-28  233  	struct adc_joystick *joy;
2c2b364fddd551 Artur Rojek     2020-09-28  234  	struct input_dev *input;
815b74328f141f Dmitry Torokhov 2024-06-09  235  	unsigned int poll_interval = 0;
815b74328f141f Dmitry Torokhov 2024-06-09  236  	unsigned int num_chans;
2c2b364fddd551 Artur Rojek     2020-09-28  237  	int error;
2c2b364fddd551 Artur Rojek     2020-09-28  238  
815b74328f141f Dmitry Torokhov 2024-06-09  239  	chans = devm_iio_channel_get_all(dev);
815b74328f141f Dmitry Torokhov 2024-06-09  240  	if (IS_ERR(chans)) {
2c2b364fddd551 Artur Rojek     2020-09-28 @241  		error = PTR_ERR(joy->chans);

s/joy->chans/chans/

2c2b364fddd551 Artur Rojek     2020-09-28  242  		if (error != -EPROBE_DEFER)
2c2b364fddd551 Artur Rojek     2020-09-28  243  			dev_err(dev, "Unable to get IIO channels");
2c2b364fddd551 Artur Rojek     2020-09-28  244  		return error;
2c2b364fddd551 Artur Rojek     2020-09-28  245  	}
2c2b364fddd551 Artur Rojek     2020-09-28  246  
24c06e000e8fa2 Chris Morgan    2022-08-16  247  	error = device_property_read_u32(dev, "poll-interval", &poll_interval);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


