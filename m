Return-Path: <linux-input+bounces-5006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD41992F851
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 11:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D7B61C20C25
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857EF13D51E;
	Fri, 12 Jul 2024 09:49:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out198-13.us.a.mail.aliyun.com (out198-13.us.a.mail.aliyun.com [47.90.198.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FCC17BB6;
	Fri, 12 Jul 2024 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720777744; cv=none; b=VKjv9uUnoT1ipjXtT9Xw8txpksxyWIFJ90PwwRBhGT+rXgu+2eoK2cMXVk0gApGm9Excrblxjb3E3b1/Gn+MN75O6cyisa+HLQ5O/G68qeyw8Qi/4OVbaNvVK33Rm8hSyQLFp/XcEp6Y1grT4mDP1n/J1Z+vtDyqS30+BY02ppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720777744; c=relaxed/simple;
	bh=VtZ60T8tWzbVpiQhzkDVdncOiC82DS3yYf31QfkoXpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=feeVnFadlGGKPcM/YxA3enpFwMv4P8f4Ndiogssn4v4frYr2MLwErgZNFXeuUKiPGs9Hq9zRu74IJ+RVaUTCDmguWXq/yoXxRJfyrAGiz/XETrRFW8nhZ4IiahN24rQ47LeS04ybQQUru47dVI7gf57mttTmA0aG5URKGszp/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.668418-0.0789009-0.252682;FP=16824078420104856794|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032065106;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.YOPRXdB_1720777716;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.YOPRXdB_1720777716)
          by smtp.aliyun-inc.com;
          Fri, 12 Jul 2024 17:48:46 +0800
From: wangshuaijie@awinic.com
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	robh@kernel.org,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V2 4/5] Add aw963xx series related interfaces to the aw_sar driver
Date: Fri, 12 Jul 2024 09:48:36 +0000
Message-ID: <20240712094836.2395132-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <869a876f-6ad8-40ff-85f2-268fb49fd475@kernel.org>
References: <869a876f-6ad8-40ff-85f2-268fb49fd475@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,=0D
=0D
On Wed, 5 Jun 2024 12:29:06, krzk@kernel.org wrote:=0D
>On 05/06/2024 11:11, wangshuaijie@awinic.com wrote:=0D
>> From: shuaijie wang <wangshuaijie@awinic.com>=0D
>> =0D
>> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>=0D
>> | Reported-by: kernel test robot <lkp@intel.com>=0D
>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>=0D
>> | Reported-by: Dan Carpenter <error27@gmail.com>=0D
>> ---=0D
>>  drivers/input/misc/aw_sar/aw963xx/aw963xx.c | 974 ++++++++++++++++++++=
=0D
>>  drivers/input/misc/aw_sar/aw963xx/aw963xx.h | 753 +++++++++++++++=0D
>>  2 files changed, 1727 insertions(+)=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.c=0D
>>  create mode 100644 drivers/input/misc/aw_sar/aw963xx/aw963xx.h=0D
>> =0D
>> diff --git a/drivers/input/misc/aw_sar/aw963xx/aw963xx.c b/drivers/input=
/misc/aw_sar/aw963xx/aw963xx.c=0D
>> new file mode 100644=0D
>> index 000000000000..7ce40174a089=0D
>> --- /dev/null=0D
>> +++ b/drivers/input/misc/aw_sar/aw963xx/aw963xx.c=0D
>> @@ -0,0 +1,974 @@=0D
>> +// SPDX-License-Identifier: GPL-2.0=0D
>> +/*=0D
>> + * AWINIC sar sensor driver (aw963xx)=0D
>> + *=0D
>> + * Author: Shuaijie Wang<wangshuaijie@awinic.com>=0D
>> + *=0D
>> + * Copyright (c) 2024 awinic Technology CO., LTD=0D
>> + */=0D
>> +#include "aw963xx.h"=0D
>> +#include "../aw_sar.h"=0D
>> +=0D
>> +#define AW963XX_I2C_NAME "aw963xx_sar"=0D
>> +=0D
>> +static void aw963xx_set_cs_as_irq(struct aw_sar *p_sar, int flag);=0D
>> +static void aw963xx_get_ref_ch_enable(struct aw_sar *p_sar);=0D
>> +=0D
>> +static int32_t aw963xx_read_init_over_irq(void *load_bin_para)=0D
>> +{=0D
>> +	struct aw_sar *p_sar =3D (struct aw_sar *)load_bin_para;=0D
>> +	uint32_t cnt =3D 1000;=0D
>> +	uint32_t reg;=0D
>> +	int32_t ret;=0D
>> +=0D
>> +	while (cnt--) {=0D
>> +		ret =3D aw_sar_i2c_read(p_sar->i2c, REG_IRQSRC, &reg);=0D
>> +		if (ret !=3D 0) {=0D
>> +			dev_err(p_sar->dev, "i2c error %d", ret);=0D
>> +			return ret;=0D
>> +		}=0D
>> +		if ((reg & 0x01) =3D=3D 0x01) {=0D
>> +			aw_sar_i2c_read(p_sar->i2c, REG_FWVER, &reg);=0D
>> +			return 0;=0D
>> +		}=0D
>> +		mdelay(1);=0D
>> +	}=0D
>> +=0D
>> +	aw_sar_i2c_read(p_sar->i2c, REG_FWVER, &reg);=0D
>> +=0D
>> +	return -EINVAL;=0D
>> +}=0D
>> +=0D
>> +static void aw963xx_convert_little_endian_2_big_endian(struct aw_bin *a=
w_bin)=0D
>> +{=0D
>> +	uint32_t start_index =3D aw_bin->header_info[0].valid_data_addr;=0D
>> +	uint32_t fw_len =3D aw_bin->header_info[0].reg_num;=0D
>> +	uint32_t uints =3D fw_len / AW963XX_SRAM_UPDATE_ONE_UINT_SIZE;=0D
>> +	uint8_t tmp1;=0D
>> +	uint8_t tmp2;=0D
>> +	uint8_t tmp3;=0D
>> +	uint8_t tmp4;=0D
>> +	int i;=0D
>> +=0D
>> +	for (i =3D 0; i < uints; i++) {=0D
>> +		tmp1 =3D aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_=
UINT_SIZE + 3];=0D
>> +		tmp2 =3D aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_=
UINT_SIZE + 2];=0D
>> +		tmp3 =3D aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_=
UINT_SIZE + 1];=0D
>> +		tmp4 =3D aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_=
UINT_SIZE];=0D
>> +		aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_UINT_SIZE=
]     =3D tmp1;=0D
>> +		aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_UINT_SIZE=
 + 1] =3D tmp2;=0D
>> +		aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_UINT_SIZE=
 + 2] =3D tmp3;=0D
>> +		aw_bin->info.data[start_index + i * AW963XX_SRAM_UPDATE_ONE_UINT_SIZE=
 + 3] =3D tmp4;=0D
>> +	}=0D
>> +}=0D
>> +=0D
>> +/**=0D
>> + * @aw963xx_sram_fill_not_wrote_area()=0D
>> + *         |----------------code ram-----------------|=0D
>> + *       0x2000                                    0x4fff=0D
>> + *         |--- app wrote here ---|--fill with 0xff--|=0D
>> + *=0D
>> + *         if the size of app is less than the size of code ram, the re=
st of the=0D
>> + *         ram is filled with 0xff.=0D
>> + * @load_bin_para=0D
>> + * @offset the rear addr of app=0D
>> + * @return int32_t=0D
>> + */=0D
>> +static int32_t aw963xx_sram_fill_not_wrote_area(void *load_bin_para, ui=
nt32_t offset)=0D
>> +{=0D
>> +	uint32_t last_pack_len =3D (AW963XX_SRAM_END_ADDR - offset) %=0D
>> +						AW963XX_SRAM_UPDATE_ONE_PACK_SIZE;=0D
>> +	uint32_t pack_cnt =3D last_pack_len =3D=3D 0 ?=0D
>> +			((AW963XX_SRAM_END_ADDR - offset) / AW963XX_SRAM_UPDATE_ONE_PACK_SIZ=
E) :=0D
>> +			((AW963XX_SRAM_END_ADDR - offset) / AW963XX_SRAM_UPDATE_ONE_PACK_SIZ=
E) + 1;=0D
>> +	uint8_t buf[AW963XX_SRAM_UPDATE_ONE_PACK_SIZE + 2] =3D { 0 };=0D
>> +	struct aw_sar *p_sar =3D (struct aw_sar *)load_bin_para;=0D
>> +	uint32_t download_addr_with_ofst;=0D
>> +	uint8_t *r_buf;=0D
>> +	int32_t ret;=0D
>> +	uint32_t i;=0D
>> +=0D
>> +	r_buf =3D devm_kzalloc(p_sar->dev, AW963XX_SRAM_UPDATE_ONE_PACK_SIZE, =
GFP_KERNEL);=0D
>> +	if (!r_buf)=0D
>> +		return -ENOMEM;=0D
>> +=0D
>> +	memset(buf, 0xff, sizeof(buf));=0D
>> +	for (i =3D 0; i < pack_cnt; i++) {=0D
>> +		memset(r_buf, 0, AW963XX_SRAM_UPDATE_ONE_PACK_SIZE);=0D
>> +		download_addr_with_ofst =3D offset + i * AW963XX_SRAM_UPDATE_ONE_PACK=
_SIZE;=0D
>> +		buf[0] =3D (uint8_t)(download_addr_with_ofst >> OFFSET_BIT_8);=0D
>> +		buf[1] =3D (uint8_t)(download_addr_with_ofst);=0D
>> +		if (i !=3D (pack_cnt - 1)) {=0D
>> +			ret =3D aw_sar_i2c_write_seq(p_sar->i2c, buf,=0D
>> +					AW963XX_SRAM_UPDATE_ONE_PACK_SIZE + 2);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, write_seq error!", i);=0D
>> +				devm_kfree(p_sar->dev, r_buf);=0D
>> +				return ret;=0D
>> +			}=0D
>> +			ret =3D aw_sar_i2c_read_seq(p_sar->i2c, buf, 2, r_buf,=0D
>> +					AW963XX_SRAM_UPDATE_ONE_PACK_SIZE);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, read_seq error!", i);=0D
>> +				devm_kfree(p_sar->dev, r_buf);=0D
>> +				return ret;=0D
>> +			}=0D
>> +			if (memcmp(&buf[2], r_buf, AW963XX_SRAM_UPDATE_ONE_PACK_SIZE) !=3D 0=
) {=0D
>> +				dev_err(p_sar->dev, "read is not equal to write ");=0D
>> +				devm_kfree(p_sar->dev, r_buf);=0D
>> +				return -EINVAL;=0D
>> +			}=0D
>> +		} else {=0D
>> +			ret =3D aw_sar_i2c_write_seq(p_sar->i2c, buf, last_pack_len + 2);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, write_seq error!", i);=0D
>> +				devm_kfree(p_sar->dev, r_buf);=0D
>> +				return ret;=0D
>> +			}=0D
>> +			ret =3D aw_sar_i2c_read_seq(p_sar->i2c, buf, 2, r_buf, last_pack_len=
);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, read_seq error!", i);=0D
>> +				devm_kfree(p_sar->dev, r_buf);=0D
>> +				return ret;=0D
>> +			}=0D
>> +			if (memcmp(&buf[2], r_buf, last_pack_len) !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "read is not equal to write ");=0D
>> +				devm_kfree(p_sar->dev, r_buf);=0D
>> +				return -EINVAL;=0D
>> +			}=0D
>> +		}=0D
>> +	}=0D
>> +=0D
>> +	devm_kfree(p_sar->dev, r_buf);=0D
>> +=0D
>> +	return 0;=0D
>> +}=0D
>> +=0D
>> +static int32_t aw963xx_sram_data_write(struct aw_bin *aw_bin, void *loa=
d_bin_para)=0D
>> +{=0D
>> +	uint8_t buf[AW963XX_SRAM_UPDATE_ONE_PACK_SIZE + 2] =3D { 0 };=0D
>> +	uint32_t start_index =3D aw_bin->header_info[0].valid_data_addr;=0D
>> +	uint32_t fw_bin_version =3D aw_bin->header_info[0].app_version;=0D
>> +	uint32_t download_addr =3D AW963XX_RAM_START_ADDR;=0D
>> +	uint32_t fw_len =3D aw_bin->header_info[0].reg_num;=0D
>> +	uint32_t last_pack_len =3D fw_len % AW963XX_SRAM_UPDATE_ONE_PACK_SIZE;=
=0D
>> +	struct aw_sar *p_sar =3D (struct aw_sar *)load_bin_para;=0D
>> +	uint32_t download_addr_with_ofst =3D 0;=0D
>> +	uint32_t pack_cnt;=0D
>> +	uint8_t *r_buf;=0D
>> +	int32_t ret =3D -EINVAL;=0D
>> +	uint32_t i;=0D
>> +=0D
>> +	r_buf =3D devm_kzalloc(p_sar->dev, AW963XX_SRAM_UPDATE_ONE_PACK_SIZE, =
GFP_KERNEL);=0D
>> +	if (!r_buf)=0D
>> +		return -ENOMEM;=0D
>> +=0D
>> +	pack_cnt =3D ((fw_len % AW963XX_SRAM_UPDATE_ONE_PACK_SIZE) =3D=3D 0) ?=
=0D
>> +			(fw_len / AW963XX_SRAM_UPDATE_ONE_PACK_SIZE) :=0D
>> +			(fw_len / AW963XX_SRAM_UPDATE_ONE_PACK_SIZE) + 1;=0D
>> +=0D
>> +	dev_info(p_sar->dev, "fw_bin_version =3D 0x%x", fw_bin_version);=0D
>> +	for (i =3D 0; i < pack_cnt; i++) {=0D
>> +		memset(r_buf, 0, AW963XX_SRAM_UPDATE_ONE_PACK_SIZE);=0D
>> +		download_addr_with_ofst =3D download_addr + i * AW963XX_SRAM_UPDATE_O=
NE_PACK_SIZE;=0D
>> +		buf[0] =3D (uint8_t)(download_addr_with_ofst >> OFFSET_BIT_8);=0D
>> +		buf[1] =3D (uint8_t)(download_addr_with_ofst);=0D
>> +		if (i !=3D (pack_cnt - 1)) {=0D
>> +			memcpy(&buf[2], &aw_bin->info.data[start_index +=0D
>> +					i * AW963XX_SRAM_UPDATE_ONE_PACK_SIZE],=0D
>> +					AW963XX_SRAM_UPDATE_ONE_PACK_SIZE);=0D
>> +			ret =3D aw_sar_i2c_write_seq(p_sar->i2c, buf,=0D
>> +					AW963XX_SRAM_UPDATE_ONE_PACK_SIZE + 2);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, write_seq error!", i);=0D
>> +				goto err_out;=0D
>> +			}=0D
>> +			ret =3D aw_sar_i2c_read_seq(p_sar->i2c, buf, 2, r_buf,=0D
>> +					AW963XX_SRAM_UPDATE_ONE_PACK_SIZE);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, read_seq error!", i);=0D
>> +				goto err_out;=0D
>> +			}=0D
>> +			if (memcmp(&buf[2], r_buf, AW963XX_SRAM_UPDATE_ONE_PACK_SIZE) !=3D 0=
) {=0D
>> +				dev_err(p_sar->dev, "read is not equal to write ");=0D
>> +				ret =3D -EIO;=0D
>> +				goto err_out;=0D
>> +			}=0D
>> +		} else { // last pack process=0D
>> +			memcpy(&buf[2], &aw_bin->info.data[start_index +=0D
>> +					i * AW963XX_SRAM_UPDATE_ONE_PACK_SIZE], last_pack_len);=0D
>> +			ret =3D aw_sar_i2c_write_seq(p_sar->i2c, buf, last_pack_len + 2);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, write_seq error!", i);=0D
>> +				goto err_out;=0D
>> +			}=0D
>> +			ret =3D aw_sar_i2c_read_seq(p_sar->i2c, buf, 2, r_buf, last_pack_len=
);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, read_seq error!", i);=0D
>> +				goto err_out;=0D
>> +			}=0D
>> +			if (memcmp(&buf[2], r_buf, last_pack_len) !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "read is not equal to write ");=0D
>> +				ret =3D -EIO;=0D
>> +				goto err_out;=0D
>> +			}=0D
>> +			/* fill 0xff in the area that not worte. */=0D
>> +			ret =3D aw963xx_sram_fill_not_wrote_area(load_bin_para,=0D
>> +					download_addr_with_ofst + last_pack_len);=0D
>> +			if (ret !=3D 0) {=0D
>> +				dev_err(p_sar->dev, "cnt%d, sram_fill_not_wrote_area error!", i);=0D
>> +				goto err_out;=0D
>> +			}=0D
>> +		}=0D
>> +	}=0D
>> +=0D
>> +err_out:=0D
>> +	devm_kfree(p_sar->dev, r_buf);=0D
>=0D
>Why do you use managed interface?=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +=0D
>> +	return ret;=0D
>> +}=0D
>> +=0D
>> +static int32_t aw963xx_update_firmware(struct aw_bin *aw_bin, void *loa=
d_bin_para)=0D
>> +{=0D
>> +	struct aw_sar *p_sar =3D (struct aw_sar *)load_bin_para;=0D
>> +	struct aw963xx *aw963xx =3D (struct aw963xx *)p_sar->priv_data;=0D
>> +	struct i2c_client *i2c =3D p_sar->i2c;=0D
>> +	int32_t ret;=0D
>> +=0D
>> +	if (aw963xx->start_mode =3D=3D AW963XX_ROM_MODE) {=0D
>> +		dev_info(p_sar->dev, "no need to update fw.");=0D
>> +		return 0;=0D
>> +	}=0D
>> +=0D
>> +	//step1: close coderam shutdown mode=0D
>=0D
>Plaese fix your style to be consistent. There is a space after //.=0D
>Always, so fix all your patches.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>=0D
>=0D
>...=0D
>=0D
>> +=0D
>> +int32_t aw963xx_check_chipid(void *data)=0D
>> +{=0D
>> +	struct aw_sar *p_sar =3D (struct aw_sar *)data;=0D
>> +	uint32_t reg_val;=0D
>> +	int32_t ret;=0D
>> +=0D
>> +	if (!p_sar)=0D
>> +		return -EINVAL;=0D
>> +=0D
>> +	ret =3D aw_sar_i2c_read(p_sar->i2c, REG_CHIP_ID0, &reg_val);=0D
>> +	if (ret < 0) {=0D
>> +		dev_err(p_sar->dev, "read CHIP ID failed: %d", ret);=0D
>> +		return ret;=0D
>> +	}=0D
>> +=0D
>> +	switch (reg_val) {=0D
>> +	case AW96303_CHIP_ID:=0D
>> +		dev_info(p_sar->dev, "aw96303 detected, 0x%04x", reg_val);=0D
>=0D
>Your driver is quite noisy. Reduce the severity of informational=0D
>messages, because driver should be quiet on success.=0D
>=0D
>I don't understand why even having dev_info in 5 places instead of one=0D
>place.=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +		memcpy(p_sar->chip_name, AW96303, 8);=0D
>> +		ret =3D 0;=0D
>> +		break;=0D
>> +	case AW96305_CHIP_ID:=0D
>> +		dev_info(p_sar->dev, "aw96305 detected, 0x%04x", reg_val);=0D
>> +		memcpy(p_sar->chip_name, AW96305, 8);=0D
>> +		ret =3D 0;=0D
>> +		break;=0D
>> +	case AW96305BFOR_CHIP_ID:=0D
>> +		dev_info(p_sar->dev, "aw96305bfor detected, 0x%04x", reg_val);=0D
>> +		memcpy(p_sar->chip_name, AW96305BFOR, 8);=0D
>> +		ret =3D 0;=0D
>> +		break;=0D
>> +	case AW96308_CHIP_ID:=0D
>> +		dev_info(p_sar->dev, "aw96308 detected, 0x%04x", reg_val);=0D
>> +		memcpy(p_sar->chip_name, AW96308, 8);=0D
>> +		ret =3D 0;=0D
>> +		break;=0D
>> +	case AW96310_CHIP_ID:=0D
>> +		dev_info(p_sar->dev, "aw96310 detected, 0x%04x", reg_val);=0D
>> +		memcpy(p_sar->chip_name, AW96310, 8);=0D
>=0D
>No, all these memcpy are just silly. You later compare strings instead=0D
>of comparing the detected chip id (integer).=0D
>=0D
=0D
The register configuration file contains a chip name string, which needs=0D
to be compared with chip_name during the validation of the register=0D
configuration file.=0D
=0D
>> +		ret =3D 0;=0D
>> +		break;=0D
>> +	default:=0D
>> +		dev_info(p_sar->dev, "chip id error, 0x%04x", reg_val);=0D
>> +		ret =3D  -EIO;=0D
>=0D
>Fix your style, just one space after =3D. This applies in multiple places.=
=0D
>=0D
=0D
The patch for v3 will fix these issues.=0D
=0D
>> +		break;=0D
>> +	}=0D
>> +=0D
>> +	return ret;=0D
>> +}=0D
>> +=0D
>=0D
>There are so many trivial issues in this driver that I think you should=0D
>start from huge cleanup from all these trivialities before sending to=0D
>review. You try to upstream a downstream, poor quality code. This is=0D
>always a pain. Instead you should take moderately recent driver, which=0D
>passed review, as a template and work on top of it with Linux coding=0D
>uniformed style.=0D
>=0D
>Best regards,=0D
>Krzysztof=0D
=0D
Kind regards,=0D
Wang Shuaijie=

